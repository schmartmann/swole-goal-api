class CreateWorkout < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.string :uuid
      t.string :name
    end
  end
end
