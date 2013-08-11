class UsersController < ApplicationController
	
	def index
		if params[:event_id]
			@event = Event.find(params[:event_id])
			raise InvalidEventError unless @event
			@users = @event.users
			@m_title = "Asistentes de #{@event.name}"
		else
			@users = User.all
			@m_title = "Usuarios"
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new
		@user.update_attributes(params[:user])
		@user.save!
		redirect_to @user
	end

	def update
		@user = User.find(params[:id])
		@user.update_attributes(params[:user])
		@user.save!
		redirect_to @user
	end

	def show
		@user = User.find(params[:id])
	end

	def login
		login_user_by_auth_code
	end
	
end
