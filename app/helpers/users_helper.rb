module UsersHelper

  def avatar_path(user)
    user.image || 'https://pacdn.500px.org/userpic.png'
  end

  def avatar(*users)
    users.map do |u|
      image_tag(avatar_path(u), class: 'avatar-image')
    end.join("").html_safe
  end
end
