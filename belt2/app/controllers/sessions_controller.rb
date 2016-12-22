class SessionsController < ApplicationController
	def create_login_user
		user = User.find_by(email: params[:email].downcase)
		if user 
	  		if user.authenticate(params[:password])
	  			session[:user_id] = user.id
	  			redirect_to "/brightideas"
	  		else
	  			flash[:errors] = "Password Incorrect"
	  			redirect_to "/users"
	  		end
	  	else
	  		flash[:errors]="Email not found"
	  		redirect_to "/users"
	  	end
	end
	def logout
		user = User.find(session[:user_id])
		session.clear
		flash[:user_out] = "#{user.first_name}, you have been Logged Out!"
		redirect_to "/users"
	end
end
