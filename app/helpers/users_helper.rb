module UsersHelper
  def gravatar_for(user, options = { :size => 50 })
    gravatar_image_tag(user.email.downcase, :alt => h(user.username),
                                            :class => 'gravatar',
                                            :gravatar => options)
  end

  def current_user?(user)
    user == current_user
  end
end
