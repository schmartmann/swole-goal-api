class CreateWorkoutExercise < ActiveRecord::Migration[5.2]
  def change
    create_table :workout_exercises do |t|
      t.references :exercise, foreign_key: true
      t.references :workout, foreign_key: true
    end
  end
end
