module ApplicationHelper

	def yesno(x)
  	x ? "Yes" : content_tag('b', "No!", :class=>'')
	end

		def dup_hash(arr)
		arr.inject(Hash.new(0)) { |h,e| h[e] += 1; h }.select {
    |k,v| v >= 1 }.inject({}) { |r, e| r[e.first] = e.last; r }
		end

    def maximum_count(hash)
      max_arr = []
      hash.each do |c|
        max_arr << c[1]
      end
      return max_arr.max
    end

		def format_boolean(status)
        if status
          icon_tick
        else
          icon_cross
        end
      end

      def icon_tick(alt_text='Tick')
        build_image_tag("/assets/001_06.png", alt_text)
      end

      def icon_cross(alt_text='Cross')
        build_image_tag("/assets/001_05.png", alt_text)
      end

      def build_image_tag(image_file, alt_text)
        image_tag(image_file, :size =>"20x20", :alt => alt_text)
      end
      def build_check_tag(image_file, alt_text)
       image_tag(image_file, :size =>"15x15", :alt => alt_text)
      end

end
