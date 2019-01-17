class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :provider, :uid, :allow_password_change, :name, :nickname,
    :image, :created_at, :updated_at, :uuid


  has_many :workouts
end
