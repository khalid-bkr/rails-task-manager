class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show          # GET /tasks/:id
    @task = Task.find(params[:id])
  end

  def new           # GET /tasks/new
    @task = Task.new
  end

  def create        # POST /tasks
    # @task = Task.create!(params[:name])
    @task = Task.create(task_params)
    redirect_to tasks_path
  end

  def edit          # GET /tasks/:id/edit
    @task = Task.find(params[:id])
  end

  def update        # PATCH /tasks/:id
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy       # DELETE /tasks/:id
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end
end
