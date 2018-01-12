class CreateMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :meals do |t|
      t.string :title
      t.text :description
      t.integer :calories_amount
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
