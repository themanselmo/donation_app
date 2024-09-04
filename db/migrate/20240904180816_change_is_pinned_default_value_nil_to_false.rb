class ChangeIsPinnedDefaultValueNilToFalse < ActiveRecord::Migration[7.2]
  def change
    change_column_default :donations, :is_pinned, from: nil, to: false
  end
end
