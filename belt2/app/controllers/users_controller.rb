class UsersController < ApplicationController
	# Main page to login /... maybe Registeration ...Or list something
	def index
	end

	#Users homepage or dashboard page... Shows users info
	def show
		@user = User.find(params[:id])
		@posts = Brightidea.where(user: @user).count
		@likes = Like.where(user: @user).count
	end

	#Method that new page has been directed to - actually Creates the New User inthe database
	def create
		user = User.create(user_params)
		if user.errors.any?
			flash[:user_create_error]= user.errors.full_messages
			redirect_to "/users"
		else
			#After creation directs User to SHOW page with Users info
			session[:user_id] = user.id
			redirect_to "/users/#{user.id}"
		end
	end

	#Page to show user to Edit/Update information
	def edit
		@user = User.find(session[:user_id])
		render "edit"
	end

	#Method that edit page has been directed to - actually Updates the New User in the database
	def update
		user = User.find(session[:user_id])
		#If password is correct - the update is allowed
		if user.authenticate(params[:password])
			#user is updated
			if user.update(profile_params)
				#After update - directs User to SHOW page with Users updated info
				redirect_to "/users/#{user.id}"
			else
				flash[:update_error] = user.errors.full_messages
				redirect_to "/users/edit"
			end
		else
			flash[:update_error] = ["Must Enter Current Password to make changes"]
			redirect_to "/users/edit"
		end
	end

	#Delete User from database
	def destroy
		user = User.find(params[:id]).destroy
		flash[:user_out] = "#{user.first_name} - Your account/profile has been permently deleted"
		redirect_to "/users"
	end

	private 
	def profile_params
		params.require(:user).permit(:first_name, :last_name, :email)
	end	
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end	
end
