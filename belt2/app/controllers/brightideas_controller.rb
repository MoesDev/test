class BrightideasController < ApplicationController
	def index
  	@ideas = Brightidea.all
    @user = User.find(session[:user_id])
  end
  def show
    @idea = Brightidea.find(params[:id])
    @likes = Like.where(brightidea: @idea)

    
    
  end

  def create
  	@idea = User.find(session[:user_id]).brightideas.create(idea: params[:idea])
  	if @idea.errors.any?
  		flash[:errors]= @idea.errors.full_messages
  	end
  	redirect_to "/brightideas"
  end
  def destroy
  	Brightidea.find(params[:id]).destroy
  	redirect_to "/brightideas"
  end

  def like
  	Like.create(user: User.find(session[:user_id]), brightidea: Brightidea.find(params[:id]))
  	redirect_to "/brightideas"
  end

  def unlike
  	Like.find_by(user: User.find(session[:user_id]), brightidea: Brightidea.find(params[:id])).destroy
  	redirect_to "/brightideas"
  end
end
