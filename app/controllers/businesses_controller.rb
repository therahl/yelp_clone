class BusinessesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]


  def index
    @businesses = Business.all
  end

  def show
    @business = Business.find(params[:id])
    @reviews = @business.reviews.all
  end

  def create
    @business = Business.new(business_params)
    @business.save
    redirect_to @business
  end

  def new
    @business = Business.new
  end

  def edit
    @business = Business.find(params[:id])
  end

  def update
    @business = Business.find(params[:id])
    if @business.update_attributes(business_params)
      redirect_to @business
    else
      render 'edit'
    end
  end

  def destroy
    @business = Business.find(params[:id])
    @business.destroy
    redirect_to businesses_path
  end

  private

  def business_params
    params.require(:business).permit(:address, :name, :city, :state, :description)
  end
end
