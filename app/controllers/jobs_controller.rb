class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @user = current_user
  end

  def index
    @jobs = current_user.jobs
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new(company: @company)
  end

  def create
    @job = Job.new(job_params)
    @job.company = Company.find(params[:company_id])
    if @job.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @job.user = current_user
    if @job.update(job_params)
      redirect_to profile_path
    else
      render :update
    end
  end

  def destroy
    @job.destroy
    redirect_to profile_path
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :level, :sector, :salary_range,
                                :benefit, :description, :start_time, :end_time)
  end
end
