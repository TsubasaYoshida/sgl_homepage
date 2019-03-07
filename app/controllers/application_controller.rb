class ApplicationController < ActionController::Base
  before_action :check_logined

  private

  def check_logined
    if session[:usr] then
      begin
        @usr = User.find(session[:usr])
      rescue ActiveRecord::RecordNotFound
        reset_session
      end
    end
    unless @usr
      redirect_to controller: :login, action: :index
    end
  end
end
