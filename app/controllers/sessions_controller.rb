class SessionsController < ApplicationController

  def create
    receptionist = Receptionist.find_by(email_id: params[:email_id])
    if receptionist && receptionist.authenticate(params[:password])
      session[:receptionist_id] = receptionist.id
      redirect_to guests_path(receptionist_id: receptionist, receptionist_email_id: receptionist.email_id, receptionist_name: receptionist.name, is_admin: receptionist.is_admin)
    else
      flash[:errors] = ['Invalid Combination!']
      redirect_to receptionists_path
    end
  end

  def destroy
        reset_session
        redirect_to :root, notice: 'Logged out'
  end
end
