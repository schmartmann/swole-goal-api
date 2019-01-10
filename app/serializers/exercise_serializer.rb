class ExerciseSerializer < ActiveModel::Serializer
  has_many :workouts

  attributes :id, :email
end
