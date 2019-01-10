class User < ApplicationRecord
  include UUID
  include DeviseTokenAuth::Concerns::User

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :workouts, dependent: :destroy
end
