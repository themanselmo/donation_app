class AddDefaultsToFundraisers < ActiveRecord::Migration[7.2]
  def change
    change_column_default :fundraisers, :current_amount, 0
  end
end
