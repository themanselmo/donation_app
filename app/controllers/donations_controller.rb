class DonationsController < ApplicationController
  def create
    @fundraiser = Fundraiser.find(params[:fundraiser_id])
    @donation = @fundraiser.donations.build(donation_params)
    @donation.user_id = current_user.id

    if @donation.save
      redirect_to @fundraiser, notice: "Donation made successfully!"
    else
      redirect_to @fundraiser, alert: "Failed to make donation."
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:amount, :message, :fundraiser_id)
  end
end
