class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts.all
  end

  def likes
     @user = User.find(params[:id])
     @likes = Like.where(user_id: @user.id)
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user.id)
  end

  private
  def user_params
  	params.require(:user).permit(:email, :name, :introduction, :user_image, :eria_id)
  end
end
