module UsersHelper
  def avatar(*users)
    users.map do |u|
      image_tag(u.image, class: 'avatar-image')
    end.join("").html_safe
  end
end
