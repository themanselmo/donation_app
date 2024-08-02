class CreateFundraisers < ActiveRecord::Migration[7.2]
  def change
    create_table :fundraisers do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.decimal :goal_amount
      t.decimal :current_amount

      t.timestamps
    end
  end
end
