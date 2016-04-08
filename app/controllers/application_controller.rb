class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  #FYI render just layout for SPA
  def index
    render text: nil, layout: true
  end
end
