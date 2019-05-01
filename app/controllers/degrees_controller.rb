class DegreesController < ApplicationController
  before_action :set_degree, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @user = current_user
  end

  def index
    @degrees = policy_scope(Degree)
  end

  def new
    @degree = Degree.new
    authorize @degree
  end

  def create
    @degree = Degree.new(degree_params)
    @degree.user = current_user
    authorize @degree
    if @degree.save
      if current_user.degrees.count == 1
        redirect_to new_experience_path
      else
        redirect_to profile_path
      end
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
    authorize @degree
  end

  def degree_params
    params.require(:degree).permit(:level, :school_name, :field, :complete)
  end
end
