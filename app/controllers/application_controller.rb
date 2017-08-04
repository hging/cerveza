class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_user

  def set_user
    @current_user = User.find_by(:id => 1)
  end
end
