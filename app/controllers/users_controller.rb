class UsersController < ApplicationController
	
	def index
		@users = User.all
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
	
end
