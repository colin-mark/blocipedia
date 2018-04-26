class UsersController < ApplicationController
  def downgrade
    @user = current_user
    @user.standard!
    redirect_to edit_user_registration_path
  end
end
