class CreateDonations < ActiveRecord::Migration[7.2]
  def change
    create_table :donations do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.decimal :amount
      t.string :message

      t.timestamps
    end
  end
end
