class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @user = current_user
  end

  def index
    @courses = current_user.courses
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.user = current_user
    if @course.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @course.user = current_user
    if @course.update(course_params)
      redirect_to profile_path
    else
      render :update
    end
  end

  def destroy
    @course.destroy
    redirect_to profile_path
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:category, :school_name, :description, :complete)
  end
end
