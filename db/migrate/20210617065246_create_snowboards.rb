class CreateSnowboards < ActiveRecord::Migration[6.1]
  def change
    create_table :snowboards do |t|
      t.string :name
      t.string :color
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
