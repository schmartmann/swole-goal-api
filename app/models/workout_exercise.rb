class WorkoutExercises < ActiveRecord::Base
  include UUID

  #----------------------------------------------------------------------------
  # attributes

  ATTRIBUTES = %i(
    uuid
    workout_id
    exercise_id
  ).freeze

  #----------------------------------------------------------------------------
  # validations

  validates :workout_id,
            presence: true,
            uniqueness: { scope: :exercise_id }

  validates :exercise_id,
            presence: true,
            uniqueness: { scope: :workout_id }

  #----------------------------------------------------------------------------
  # associations

  belongs_to  :workout
  belongs_to  :exercise
end
