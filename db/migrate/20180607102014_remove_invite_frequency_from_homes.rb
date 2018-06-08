class RemoveInviteFrequencyFromHomes < ActiveRecord::Migration[5.1]
  def change
    remove_column :homes, :invite_frequency, :integer
  end
end
