class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @user = current_user
  end

  def index
    @companies = policy_scope(Company)
  end

  def new
    @company = Company.new
    authorize @company
  end

  def create
    @company = Company.new(company_params)
    @company.user = current_user
    authorize @company
    if @company.save
      if current_user.companies.count == 1
        redirect_to edit_user_registration_path
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
    @company.user = current_user
    if @company.update(company_params)
      redirect_to profile_path
    else
      render :update
    end
  end

  def destroy
    @company.destroy
    redirect_to profile_path
  end

  private

  def set_company
    @company = Company.find(params[:id])
    authorize @company
  end

  def company_params
    params.require(:company).permit(:name, :sector, :address, :phone, :latitude, :longitude)
  end
end
