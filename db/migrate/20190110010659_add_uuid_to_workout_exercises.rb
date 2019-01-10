class AddUuidToWorkoutExercises < ActiveRecord::Migration[5.2]
  def change
    add_column :workout_exercises, :uuid, :string
  end
end
