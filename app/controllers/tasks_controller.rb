class TasksController < ApplicationController
  def index
    @task=Task.new
    @q=Task.ransack(params[:q])
    @tasks=@q.result(distinct: true).page(params[:page])
  end

  def create
    @task=current_user.tasks.new(task_params)
    if @task.save
      TaskMailer.creation_email(@task).deliver_now
      redirect_back(fallback_location:tasks_path)
    end
  end

  private
  def task_params
    params.require(:task).permit(:body,:importance)
  end

end
