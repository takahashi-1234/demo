class TasksController < ApplicationController
  def index
    @task=Task.new
    @q=Task.ransack(params[:q])
    @tasks=@q.result(distinct: true).page(params[:page])
  end

  def create
    task=Task.new(task_params)
    task.save
    redirect_back(fallback_location:tasks_path)
  end

  private
  def task_params
    params.require(:task).permit(:body,:importance)
  end

end