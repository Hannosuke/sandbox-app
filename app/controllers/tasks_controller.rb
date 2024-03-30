class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:notice] = 'Task created successfully'
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:notice] = 'Task updated successfully'
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task.destroy

    flash[:notice] = 'Task deleted successfully'
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
