class CreateExercise < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :uuid
      t.string :name
      t.string :unit
      t.integer :quantity
    end
  end
end
