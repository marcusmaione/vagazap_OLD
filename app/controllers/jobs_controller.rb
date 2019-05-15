class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy, :candidates]
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @user = current_user
  end

  def index
    @company = Company.find(params[:company_id])
    @jobs = policy_scope(Job)
    authorize @company.jobs
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new(company: @company)
    authorize @job
  end

  def create
    @job = Job.new(job_params)
    authorize @job
    @job.company = Company.find(params[:company_id])
    if @job.save
      redirect_to company_jobs_path(@job.company)
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params[:company_id])
    @job.company = @company
  end

  def update
    @company = Company.find(params[:company_id])
    @job.company = @company
    if @job.update(job_params)
      redirect_to company_jobs_path(@job.company)
    else
      render :update
    end
  end

  def destroy
    @job.destroy
    redirect_to profile_path
  end

  def candidates
    job = Job.find(params[:id])
    @filtered_candidates = User.initial_filter(job)
    candidates_hash = {}
    match_potential = 0
    @filtered_candidates.each do |candidate|
      match_potential -= 2 if candidate.first_name == 'Joao'
      match_potential -= 1 if candidate.last_name == 'Silva'
      candidates_hash[candidate] = match_potential
      match_potential = 0
    end
    @all_candidates = candidates_hash.sort_by { |key, value| value }
  end

  private

  def set_job
    @job = Job.find(params[:id])
    authorize @job
  end

  def job_params
    params.require(:job).permit(:title, :level, :sector, :salary_range,
                                :benefit, :description, :start_time, :end_time,
                                :education_requirement)
  end
end
