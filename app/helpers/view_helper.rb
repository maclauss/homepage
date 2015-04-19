module ViewHelper

  def skill_superstar(skill_name)
    ret = "<div class=\"row\"><div class=\"col-xs-8 skill\">"+skill_name+"</div><div class=\"col-xs-4 skill-superstar\">"
    5.times do
      ret = ret+"<span class=\"glyphicon glyphicon-star\"></span>"
    end
    ret = ret+"</div></div>"
    ret.html_safe
  end

  def skill_lg(skill_name, stars)
    ret = "<div class=\"row\"><div class=\"col-xs-8 skill\">"+skill_name+"</div><div class=\"col-xs-4 skill-stars\">"
    stars.times do
      ret = ret+"<span class=\"glyphicon glyphicon-star\"></span>"
    end
    ret = ret+"</div></div>"
    ret.html_safe
  end
end