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

  def new
    @fundraiser = Fundraiser.new
  end

  def create
    @fundraiser = Fundraiser.new(fundraiser_params)
    @fundraiser.user = current_user

    if @fundraiser.save
      redirect_to fundraiser_path(@fundraiser.id)
    else
      render :new
    end
  end

  def my_fundraisers
    @my_fundraisers = current_user.fundraisers
  end

  private

  def fundraiser_params
    params.require(:fundraiser).permit(:name, :description, :goal_amount)
  end
end
