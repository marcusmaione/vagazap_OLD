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

  # def candidates
  #   job = Job.find(params[:id])
  #   @filtered_candidates = User.initial_filter(job)
  #   candidates_hash = {}
  #   match_potential = 0
  #   @filtered_candidates.each do |candidate|
  #     candidate.experiences.each do |experience|
  #       match_potential -= 70 if experience.level.include?('mais de 5 anos')
  #       match_potential -= 60 if experience.level.include?('5 anos')
  #       match_potential -= 50 if experience.level.include?('4 anos')
  #       match_potential -= 40 if experience.level.include?('3 anos')
  #       match_potential -= 30 if experience.level.include?('2 anos')
  #       match_potential -= 20 if experience.level.include?('1 ano')
  #       match_potential -= 10 if experience.level.include?('menos de 1 ano')
  #     end
  #     candidate.degrees.each do |degree|
  #       match_potential -= 3 if degree.level.include?('Mestrado') || degree.level.include?('Doutorado')
  #       match_potential -= 2 if degree.level.include?('Pós-graduação') || degree.level.include?('Ensino Superior')
  #       match_potential -= 1 if degree.level.include?('Ensino Médio')
  #     end
  #     candidates_hash[candidate] = match_potential
  #     match_potential = 0
  #   end
  #   @all_candidates = candidates_hash.sort_by { |key, value| value }
  # end

  def candidates
    job = Job.find(params[:id])
    @filtered_candidates = User.initial_filter(job)
    candidates_hash = {}
    match_potential = 0
    @filtered_candidates.each do |candidate|
      candidate.experiences.each do |experience|
        match_potential -= 70 if experience.level.include?('mais de 5 anos')
        match_potential -= 60 if experience.level.include?('5 anos')
        match_potential -= 50 if experience.level.include?('4 anos')
        match_potential -= 40 if experience.level.include?('3 anos')
        match_potential -= 30 if experience.level.include?('2 anos')
        match_potential -= 20 if experience.level.include?('1 ano')
        match_potential -= 10 if experience.level.include?('menos de 1 ano')
      end
      candidate.degrees.each do |degree|
        match_potential -= 3 if degree.level.include?('Mestrado') || degree.level.include?('Doutorado')
        match_potential -= 2 if degree.level.include?('Pós-graduação') || degree.level.include?('Ensino Superior')
        match_potential -= 1 if degree.level.include?('Ensino Médio')
      end
      candidates_hash[candidate] = match_potential
      match_potential = 0
    end
    @all_candidates = candidates_hash.sort_by { |key, value| value }
  end

  def candidate
    @candidate = User.find(params[:id])
    authorize current_user
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
