# Preview all emails at http://localhost:3000/rails/mailers/task_mailer
class TaskMailerPreview < ActionMailer::Preview
  def task
    task=Task.new(body: "勉強をする")
    TaskMailer.send_mail(task)
  end
end
