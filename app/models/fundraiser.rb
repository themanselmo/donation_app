class Fundraiser < ApplicationRecord
  belongs_to :user
  has_many :donations

  accepts_nested_attributes_for :donations

  def recalculate_current_amount
    summed_amount = donations.sum(:amount)
    if current_amount != summed_amount
      update(current_amount: summed_amount)
    end
  end
end
