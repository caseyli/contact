class AdminMailer < ActionMailer::Base
  default from: "from@example.com"

  def customer_contact(full_name, email, message)
    @full_name, @email, @message = full_name, email, message
    mail(:to => admin_email,
         :subject => "Website: Message from #{@email}")
  end

  def admin_email
    "admin@gmail.com"
  end
end
