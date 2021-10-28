class StatusesController < ApplicationController
  def create
    task=Task.find(params[:task_id])
    status=current_user.statuses.new(task_id: task.id)
    status.save
    redirect_back(fallback_location:tasks_path)
  end
  def destroy
  end
  def index
    @q=current_user.finished_tasks.ransack(params[:q])
    @tasks=@q.result(distinct: true).page(params[:page])
  end
end
