class FundraisersController < ApplicationController
  def index
    @fundraisers = Fundraiser.all
  end

  def show
    @fundraiser = Fundraiser.find(params[:id])

    if @fundraiser.present?
      @fundraiser
    else
      render :not_found
    end
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
