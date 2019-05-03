class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show]

  def show
  end

  def new
    @user = current_user
    authorize @user
  end

  def create
    @user = current_user
    authorize @user
    if @user.save(detail_params)
      redirect_to profile_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(detail_params)
      if current_user.companies.count == 1
        redirect_to profile_path
      elsif current_user.degrees.empty?
        redirect_to new_degree_path
      else
        redirect_to profile_path
      end
    else
      render :update
    end
  end

  private

  def set_user
    @user = current_user
    authorize @user
  end

  def detail_params
    params.require(:user).permit(:first_name, :last_name, :phone, :avatar, :cpf)
  end
end
