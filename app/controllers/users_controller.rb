class UsersController < ApplicationController
  def index
    @usesr = Uers.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :email)
  end
  
end
