class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :name

  has_many :exercises, through: :workout_exercises
end
