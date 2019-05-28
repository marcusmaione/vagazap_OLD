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

    # @company = Company.find(params[:company_id])
    # @favorite.company = @company

    @job = Job.find(params[:id])
    @favorite.job = @job

    # @favorite.user = candidate

    @favorite_user = User.find(params[:user_id])
    @favorite.user = @favorite_user
    # authorize current_user

    # @favorite.user = current_user
    # @favorite.user = User.find(params[:user_id])

    authorize @favorite

    if @favorite.save
      redirect_to root_path
    else
      redirect_to profile_path
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

  def favorite_params
    params.require(:favorite).permit(:id, :user_id)
  end
end
