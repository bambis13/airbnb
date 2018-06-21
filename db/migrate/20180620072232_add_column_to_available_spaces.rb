class AddColumnToAvailableSpaces < ActiveRecord::Migration[5.1]
  def change
    add_column :available_spaces, :text, :text
  end
end
