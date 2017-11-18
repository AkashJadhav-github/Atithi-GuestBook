class ReceptionistsController < ApplicationController

  def index
      if current_user
        redirect_to guests_path
      else
        @receptionist = Receptionist.new
      end
  end

  def create
    receptionist = Receptionist.new(receptionist_params)
    if receptionist.save
      flash[:notice] = "Receptionist successfully created"

      if current_user == nil && receptionist.id
        session[:receptionist_id] = receptionist.id
        redirect_to receptionists_path
      elsif current_user.email_id == "admin@coreuser.com" && receptionist.id
        redirect_to guests_path
      end

    else
      flash[:errors] = receptionist.errors.full_messages
      redirect_to receptionists_path
    end
  end

  def show
    @receptionist = Receptionist.find(params[:id])
    @guests = @receptionist.guests
  end

  private
  def receptionist_params
    params.require(:receptionist).permit(:name, :email_id, :password, :password_confirmation, :is_admin)
  end

end
