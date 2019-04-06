class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def profile
    @user = current_user
    @companies = @user.companies
    @favorites = @user.favorites
  end
end