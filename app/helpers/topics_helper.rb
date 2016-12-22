module TopicsHelper
  def get_star(user_admin_rank)
    if user_admin_rank == -1
      "<i class='fa fa-star gold-star'></i>"
    elsif user_admin_rank > 0
      "<i class='fa fa-star blue-star'></i>"
    else
      ''
    end
  end
end
