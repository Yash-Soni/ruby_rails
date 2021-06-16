class CreateMarks < ActiveRecord::Migration[6.1]
  def change
    create_table :marks do |t|

        t.integer :mark1
        t.integer :mark2

      t.timestamps
    end
  end
end
