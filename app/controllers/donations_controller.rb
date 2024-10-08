class DonationsController < ApplicationController
  def create
    @fundraiser = Fundraiser.find(params[:fundraiser_id])
    @donation = @fundraiser.donations.build(donation_params)
    @donation.user_id = current_user.id

    if @donation.save
      UserMailer.donation_received(@donation).deliver_later

      redirect_to @fundraiser, notice: "Donation made successfully!"
    else
      redirect_to @fundraiser, alert: "Failed to make donation."
    end
  end

  def my_donations
    @my_donations = current_user.donations
  end

  def toggle_pinned
    @donation = Donation.find(params[:id])

    if @donation.present?
      @donation.update(is_pinned: !@donation.is_pinned)
    else
      # return not found
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:amount, :message, :fundraiser_id)
  end
end
