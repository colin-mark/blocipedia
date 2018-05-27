module WikisHelper
  def user_is_authorized_for_wiki?(wiki)
    if action_name == 'new'
      current_user.premium? || current_user.admin?
    else
      (current_user.premium? && current_user == wiki.user) || current_user.admin?
    end
  end

  def user_is_authorized_for_private_wikis?(wiki)
    if wiki.private?
      current_user == wiki.user || current_user.admin?
    else
      User.present?
    end
  end
end
