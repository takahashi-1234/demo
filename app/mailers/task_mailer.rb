class TaskMailer < ApplicationMailer
  def creation_email(task)
    @task=task
    mail(
      subject:"タスク作成完了メール",
      to:"riki.1130@icloud.com",
      from:"task@example.com"
    )
  end
end
