class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show]

  def show
  end

  def index
  end

  def new
  end

  def create
    @favorite = Favorite.new()

    @job = Job.find(params[:job_id])
    @favorite.job = @job

    @favorite.user = current_user

    authorize @favorite

    if @favorite.save
      redirect_to profile_path
    else
      redirect_to company_path(@job.company)
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @favorite.destroy
    redirect_back(fallback_location: job_candidates_path(@company, job))
  end

  private

  def set_favorite
    @favorite = Favorite.find(params[:id])
    authorize @favorite
  end

  # def favorite_params
  #   params.require(:favorite).permit()
  # end
end
