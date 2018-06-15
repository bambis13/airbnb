class AddColumnToCancelPolicy < ActiveRecord::Migration[5.1]
  def change
    add_reference :cancel_policies, :home, foreign_key: true
  end
end
