module ViewHelper

  # Logs in the given user.
  def skill(skill_name, stars)
    ret = "<div class=\"row\"><div class=\"col-xs-5\">"+skill_name+"</div><div class=\"col-xs-7\">"
    stars.times do
      ret = ret+"<span class=\"glyphicon glyphicon-star\"></span>"
    end
    ret = ret+"</div></div>"
    ret.html_safe
  end
end