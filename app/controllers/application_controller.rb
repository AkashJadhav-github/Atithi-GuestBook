class ApplicationController < ActionController::Base
  before_action :set_cache_buster
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_receptionist
    Receptionist.find(session[:receptionist_id]) if session[:receptionist_id]
  end

  def require_login
    unless session[:receptionist_id]
      flash[:errors]=['You must Login first']
      redirect_to root_path
    end
  end

  def current_user
    if session[:receptionist_id]
      Receptionist.find_by_id(session[:receptionist_id])
    else
      return nil
    end
  end

  def set_cache_buster
    response.headers['Cache-Control'] = 'no-cache, no-store, max-age=0, must-revalidate'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = expires_now()
  end

end
