class WorkoutsController < ApplicationController
  before_action :authenticate_user!

  PERMITTED_ATTRIBUTES = %i(
    :uuid,
    :name,
    :exercise_uuids
  )

  def query
    render json: current_user.workouts
  end

  def read
  end

  def write
  end

  private; def workout_params
    params.require( :workout ).permit( PERMITTED_ATTRIBUTES )
  end
end
