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

	def edit
		@user = User.find(params[:id])
	end

	def update
		if @user.update_attributes(params[:user])
			render '/home', notice: "Updated User Successfully"
		else 
			render :back, notice: @user.errors.full_message
		end
	end

	def create
		@user = User.new(user_params)
			if @user.save
				session[:user_id] = @user.id
				redirect_to home_path, notice: "User successfully created"
			else
				@errors = @user.errors.full_messages
				redirect_to :back, notice: "#{@errors}"
			end	
	end

	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			redirect_to :back, notice: "User deleted"
		end
	end

	private

	def user_params
		params.require(:user).permit(:login, :email, :password, :password_confirmation, :phonenumber)
	end
end
