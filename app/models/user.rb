class User < ApplicationRecord
  include UUID
  include DeviseTokenAuth::Concerns::User

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many  :workouts, dependent: :destroy
end
