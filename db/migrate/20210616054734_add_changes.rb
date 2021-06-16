class AddChanges < ActiveRecord::Migration[6.1]
  def change
    remove_timestamps :books
    remove_column :marks, :marks3
  end
end
