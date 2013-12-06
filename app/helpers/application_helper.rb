module ApplicationHelper

	def yesno(x)
  	x ? "Yes" : content_tag('b', "No!", :class=>'')
	end

		def dup_hash(arr)
		arr.inject(Hash.new(0)) { |h,e| h[e] += 1; h }.select {
    |k,v| v >= 1 }.inject({}) { |r, e| r[e.first] = e.last; r }
		end

end
