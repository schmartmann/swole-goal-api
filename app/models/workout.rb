class Workout < ActiveRecord::Base
  include UUID

  #----------------------------------------------------------------------------
  # attributes

  ATTRIBUTES = %i(
    uuid
    id
    name
  ).freeze

  #----------------------------------------------------------------------------
  # validations

  validates :name,
            presence: true,
            uniqueness: true

  #----------------------------------------------------------------------------
  # associations

  belongs_to  :user
  has_many    :workout_exercises, dependent: :destroy
  has_many    :exercises, through: :workout_exercises
end
