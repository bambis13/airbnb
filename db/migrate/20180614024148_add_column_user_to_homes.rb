class AddColumnUserToHomes < ActiveRecord::Migration[5.1]
  def change
    add_reference :homes, :user, foreign_key: true
  end
end
