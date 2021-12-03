class ApplicationController < ActionController::Base
  before_action :basic_auth_furima

  private
  def basic_auth_furima
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_FURIMA_USER"] && password == ENV["BASIC_AUTH_FURIMA_PASSWORD"]
    end
  end
end
