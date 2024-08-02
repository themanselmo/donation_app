class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :fundraiser

  after_create :update_fundraiser_current_amount

  private

  def update_fundraiser_current_amount
    new_amount = fundraiser.current_amount + amount
    fundraiser.update(current_amount: new_amount)
  end
end
