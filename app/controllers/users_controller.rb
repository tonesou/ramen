class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render 'users/edit'
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :email, :introduction)
  end

end
