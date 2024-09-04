class AddIsPinnedToDonations < ActiveRecord::Migration[7.2]
  def change
    add_column :donations, :is_pinned, :boolean
  end
end
