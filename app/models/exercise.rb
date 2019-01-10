class Exercise < ActiveRecord::Base
  include UUID


  #----------------------------------------------------------------------------
  # attributes

  ATTRIBUTES = %i(
    id
    uuid
    name
    quantity
    unit
  ).freeze

  UNITS = %w(
    x
    second
    seconds
    minute
    minutes
    hour
    hours
  )

  #----------------------------------------------------------------------------
  # validations

  validates :name,
            presence: true,
            uniqueness: true

  validates :unit,
            presence: true,
            inclusion: {
              in: UNITS
            }

  validates :quantity,
            presence: true,
            numericality: true

  #----------------------------------------------------------------------------
  # associations

  has_many  :workout_exercises, dependent: :destroy
  has_many  :workouts, through: :workout_exercises
end
