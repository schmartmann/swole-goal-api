class WorkoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_exercises, only: [ 'write' ]

  PERMITTED_ATTRIBUTES = %i(
    uuid
    name
  )

  def query
    render json: current_user.workouts
  end

  def read
    workouts = current_user.workouts.where( uuid: params[ :uuid ] )
    render json: workouts
  end

  def write
    unless existing_workout
      workout = current_user.workouts.create( workout_params )

      if workout.valid?
        workout.exercises = exercises

        if workout.save
          render json: workout
        end
      else
        render json: {
          message: 'Malformed parameters',
          errors: workout.errors.full_messages.join( ';' )
        }
      end
    else
      render json: existing_workout
    end
  end

  def existing_workout
    @existing_workout ||= Workout.where( workout_params ).first
  end

  private; def require_exercises
    unless exercise_uuids
      render json: {
        error: 'Missing required parameter: exercise_uuids'
      },
      status: 404
    end
  end

  def exercise_uuids
    @exercise_uuids ||= params[ :workout ][ :exercise_uuids ]
  end

  def exercises
    @exercises ||= Exercise.where( uuid: exercise_uuids )
  end

  private; def workout_params
    params.require( :workout ).permit( PERMITTED_ATTRIBUTES )
  end
end
