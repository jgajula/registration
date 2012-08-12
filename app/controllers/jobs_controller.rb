class JobsController < ApplicationController
  
  def create
    @user = User.find(params[:user_id])
    @job = @user.jobs.create(params[:job])
    redirect_to user_path(@user)
  end  
 
  def destroy
    @user = User.find(params[:user_id])
    @job = @user.jobs.find(params[:id])
    @job.destroy
    redirect_to user_path(@user)
  end
  
  def edit
    @user = User.find(params[:user_id])
    @job = @user.jobs.find(params[:id])
    flash[:jobTitle] = @job.title
    flash[:jobCompany] = @job.company
  end
  
  def update
    @job = Job.find()
  end
    
end
