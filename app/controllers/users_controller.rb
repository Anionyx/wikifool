class UsersController < ApplicationController
  before_filter :authenticate_user!

  def update
    if currrent_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path(currrent_user)
    else
      render "devise/registrations/edit"
    end
  end

  def show
    @user = User.find(params[:id])
    @wikis = @user.posts.visible_to(currrent_user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar, :email_favorites)
  end
end
