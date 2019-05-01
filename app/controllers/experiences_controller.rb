class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @user = current_user
  end

  def index
    @experiences = policy_scope(Experience)
  end

  def new
    @experience = Experience.new
    authorize @experience
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.user = current_user
    authorize @experience
    if @experience.save
      if current_user.experiences.count == 1
        redirect_to new_course_path
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
    @experience.user = current_user
    if @experience.update(experience_params)
      redirect_to profile_path
    else
      render :update
    end
  end

  def destroy
    @experience.destroy
    redirect_to profile_path
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
    authorize @experience
  end

  def experience_params
    params.require(:experience).permit(:company_name, :company_sector, :title, :level, :sector,
                                       :description, :start_date, :end_date)
  end
end
