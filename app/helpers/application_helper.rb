module ApplicationHelper

	def yesno(x)
  	x ? "Yes" : content_tag('b', "No!", :class=>'')
	end

end
