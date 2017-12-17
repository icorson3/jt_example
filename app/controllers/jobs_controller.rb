class JobsController < ApplicationController
  def index
    if params[:sort]
      @jobs = Job.which_sort_params(params[:sort])
      render :"sort/index"
    elsif params[:location]
      @jobs = Job.find_city(params[:location])
      render :"sort/index"
    else
      @company = Company.find(params[:company_id])
      @jobs = @company.jobs
      @contact = @company.contacts.new
    end
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comment = @job.comments.new
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    job = Job.update(params[:id], job_params)
    redirect_to company_job_path(job.company, job)
  end

  def destroy
    Job.destroy(params[:id])
    redirect_to company_jobs_path(params[:company_id])
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
