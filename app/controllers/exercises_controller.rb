class ExercisesController < ApplicationController
  before_action :authenticate_user!

  PERMITTED_ATTRIBUTES = %i(
    id
    uuid
    name
    quantity
    unit
  )

  def query
    exercises = Exercise.all
    render json: exercises
  end

  def read
    exercise = Exercise.find_by( uuid: params[ :uuid ] )
    render json: exercise
  end

  def write
    unless existing_exercise
      exercise = Exercise.new( exercise_params )

      if exercise.valid? && exercise.save
        render json: exercise
      else
        render json: {
          error: 'Malformed parameters',
          errors: exercise.errors.full_messages.join( ';' )
        }
      end
    else
      render json: existing_exercise
    end
  end

  def existing_exercise
    @existing_exercise ||= Exercise.where( exercise_params ).first
  end

  private; def exercise_params
    params.require( :exercise ).permit( PERMITTED_ATTRIBUTES )
  end
end
