class FundraisersController < ApplicationController
  def show
    @fundraisers = Fundraiser.all

    @fundraisers
  end

  def create
    @fundraiser = Fundraiser.new(fundraiser_params)
    if @fundraiser.save
      # redirect to fundraiaser_details
    else
      render :new
    end
  end

  private

  def fundraiser_params
    params.require(:fundraiser).permit(:name, :description, :goal_amount)
  end
end
