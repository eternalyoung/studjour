class ApplicationController < ActionController::Base
  before_action :authorization, only: %i[new create edit update destroy]

  def current_user
    rodauth.rails_account
  end
  helper_method :current_user

  private

  def authenticate
    rodauth.require_account # redirect to login page if not authenticated
  end

  def authorization
    render_forbidden
  end

  def render_forbidden
    render(file: File.join(Rails.root, "public/403.html"), status: :forbidden, layout: false)
  end
end
