class ExerciseSerializer < ActiveModel::Serializer
  has_many :workouts, through: :workout_exercises

  attributes :id, :uuid, :name, :quantity, :unit
end
