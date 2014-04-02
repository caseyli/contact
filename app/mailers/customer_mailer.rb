class CustomerMailer < ActionMailer::Base
  default from: "from@example.com"

  def contact_confirmation(params)
    @params = params
    mail(:to => params[:email],
         :subject => "Website: Thanks for contacting us!")
  end
end
