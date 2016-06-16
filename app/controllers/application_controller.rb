class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  require 'will_paginate/array'

  def check_if_admin
  if signed_in?
    if !current_user.admin?
      redirect_to welcome_homepage_url
    end
  else
    # or you can use the authenticate_user! devise provides to only allow signed_in users
    redirect_to new_user_session_url
  end
end
end
