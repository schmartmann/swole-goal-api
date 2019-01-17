class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :name, :quantity, :unit

  has_many :workouts, through: :workout_exercises
end
