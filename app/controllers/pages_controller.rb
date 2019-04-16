class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def profile
    @user = current_user
    @degrees = @user.degrees
    @courses = @user.courses
    @experiences = @user.experiences
    @companies = @user.companies
    @favorites = @user.favorites
  end
end
