class ApplicationController < ActionController::Base
  def current_user
    rodauth.rails_account
  end
  helper_method :current_user

  private

  def authenticate
    rodauth.require_account # redirect to login page if not authenticated
  end
end
