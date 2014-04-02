class PagesController < ApplicationController
  def home
  end

  def contact
    @success = false
    @message = ""
    
    if request.post?
      if valid_contact_form?
        AdminMailer.customer_contact(contact_params).deliver
        CustomerMailer.contact_confirmation(contact_params).deliver
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

  def permitted_contact_params
    ["full_name", "email", "cell_phone", "allow_sms_response", "message"]
  end

  def contact_params
    params.keep_if { |k| permitted_contact_params.include? k }
  end

  def valid_contact_form?
    params[:cell_phone].present? ||
    params[:email].present?
  end
end
