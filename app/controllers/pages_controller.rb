class PagesController < ApplicationController
  def home
  end

  def contact
    @success = false
    @message = ""
    
    if request.post?
      if valid_contact_form?(params)
        full_name = params[:full_name]
        email = params[:email]
        cell_phone = params[:cell_phone]
        message = params[:message]
        allow_sms_response = params[:allow_sms_response]

        AdminMailer.customer_contact(full_name, email, cell_phone, allow_sms_response, message).deliver
        CustomerMailer.contact_confirmation(full_name, email, cell_phone, allow_sms_response, message).deliver
        @success = true

      else
        @success = false
        @message = "At least one of e-mail or cell phone is required"
      end
    end

    respond_to do |format|
      format.html 
      format.json { render :json => { :success => @success, :message => @message }.to_json }
    end
  end

  private

    def valid_contact_form(params)
      params[:cell_phone].present? ||
      params[:email].present?
    end
end
