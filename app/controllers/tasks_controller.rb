class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end


  def show
    @task = Task.find(params[:id])
  end


  def new
    @task = Task.new
  end

  def create
  Task.create!(params.require(:task).permit(:title,:details))
  redirect_to tasks_path
  end

  def edit
  @task = Task.find(params[:id])

  end

  def update
    @task = Task.find(params[:id])
    @task.update(params.require(:task).permit(:title,:details))
    redirect_to tasks_path(@task.id)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end



end

