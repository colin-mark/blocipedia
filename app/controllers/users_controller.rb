class UsersController < ApplicationController
  def downgrade
    @user = current_user
    @wikis = current_user.wikis
    @user.standard!
    @wikis.update_all(private: false)
    redirect_to edit_user_registration_path
  end
end
