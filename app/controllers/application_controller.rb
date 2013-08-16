# coding: utf-8
class ApplicationController < ActionController::Base
	protect_from_forgery

	def login_user_by_auth_code
		raise Application::InvalidCodeError if params[:auth_code].blank?
		@user = User.by_auth_code params[:auth_code]
		raise Application::InvalidCodeError unless @user
		sign_in @user
		flash[:notice] = "Gusto de verte, #{@user.name}"
		redirect_to browse_attendees_event_path(@user.events.first)
	rescue Application::InvalidCodeError
		flash[:error] = "Código inválido, por favor comunícate con el rpoductor de tu evento"
		redirect_to root_path
	end
end
