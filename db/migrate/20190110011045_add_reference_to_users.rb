class AddReferenceToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :workouts, :user,  index: true
    remove_reference :exercises, :user,  index: true
  end
end
