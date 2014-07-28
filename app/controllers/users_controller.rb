class UsersController < ApplicationController
	def index
		@users = User.all
	end 

	def show
		@user = User.find(params[:id])
	end

	def new 
		@user = User.new
	end

	def create
		@user = User.new(user_params)
			if @user.save
				redirect_to new_user_session_path
			else
				redirect_to :back				
			end	
	end

	private

	def user_params
		params.require(:user).permit(:login, :email, :password, :password_confirmation, :phonenumber)
	end
end
