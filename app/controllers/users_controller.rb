class UsersController < ApplicationController
	helper_method :auth_link_for
	# admin actions

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
		@event = Event.find(params[:event_id])
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

	def query
		@user = User.find_by_email params[:email]
		render json: {existing: false} and return unless @user
		render json: {existing: true, user_id: @user.id, name: @user.name}
	end

	def link
		@event = Event.find(params[:event_id])
		raise InvalidEventError unless @event
		@user = User.find(params[:id])
		raise InvalidUserError unless @user
		@event.users << @user unless @event.users.include? @user
		flash[:success] = "Usuario [#{@user.name}] agregado al evento"
		redirect_to event_users_path(@event)
	end

	def auth_link_for user
		raise ArgumentError, "Usuario no debe ser nuevo" unless user.persisted?
		unless user.auth_code
			user.set_auth_code
			user.save!
		end
		return signin_by_code_path(user.auth_code)
	end
end
