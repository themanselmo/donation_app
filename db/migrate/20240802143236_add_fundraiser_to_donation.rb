class AddFundraiserToDonation < ActiveRecord::Migration[7.2]
  def change
    add_reference :donations, :fundraiser, null: false, foreign_key: true
  end
end
