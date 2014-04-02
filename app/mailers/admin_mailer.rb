class AdminMailer < ActionMailer::Base
  default from: "from@example.com"

  def customer_contact(params)
    @params = params
    mail(:to => admin_email,
         :subject => "Website: Message from #{params[:email]}")
  end

  def admin_email
    "admin@gmail.com"
  end
end
