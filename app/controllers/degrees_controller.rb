class DegreesController < ApplicationController
  before_action :set_degree, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @user = current_user
  end

  def index
    @degrees = current_user.degrees
  end

  def new
    @degree = Degree.new
  end

  def create
    @degree = Degree.new(degree_params)
    @degree.user = current_user
    if @degree.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @degree.user = current_user
    if @degree.update(degree_params)
      redirect_to profile_path
    else
      render :update
    end
  end

  def destroy
    @degree.destroy
    redirect_to profile_path
  end

  private

  def set_degree
    @degree = Degree.find(params[:id])
  end

  def degree_params
    params.require(:degree).permit(:level, :school_name, :field, :complete)
  end
end
