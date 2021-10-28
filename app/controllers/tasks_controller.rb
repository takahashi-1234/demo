class TasksController < ApplicationController
  def index
    @task=Task.new
    @q=Task.ransack(params[:q])
    @tasks=@q.result(distinct: true).page(params[:page])

    gon.weekly=(Date.today.beginning_of_week..Date.today).to_a
    gon.weekly_tasks=gon.weekly.map{|item| Task.where(created_at: item.beginning_of_day..item.end_of_day).count}
  end

  def create
    @task=current_user.tasks.new(task_params)
    @task.save
      redirect_back(fallback_location:tasks_path)
  end

  private
  def task_params
    params.require(:task).permit(:body,:importance)
  end

end
