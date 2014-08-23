class OmniController < ApplicationController
def new
	info = request.env["omniauth.auth"]
	em = info["info"]["email"]
	@user = User.find_by_email(em)
	if (@user.nil?)
		@user = User.new
		@user.email = em
		@user.name = info["info"]["first_name"]
		@user.password	= info["uid"]
		@user.password_confirmation = info["uid"]
		@user.fb = info["uid"]
	
		if @user.save
			session[:user_id] = @user.id
			redirect_to home_path, notice: "User successfully created"
		else
			@errors = @user.errors.full_messages
			redirect_to :back, notice: "#{@errors}"
		end
	else
		if (@user.fb.nil?)	
			@user.email = em
			@user.name = info["info"]["first_name"]
			@user.fb = info["uid"]
			if @user.save
				session[:user_id] = @user.id
				redirect_to home_path, notice: "Logged In"
			end
		else
				session[:user_id] = @user.id
				redirect_to home_path, :notice => "Logged In"
		end
	end
end
end
