module ProductsHelper

	def product_profile_image(product)
		if product.product_img == nil
			"no-image.png"
		else
			product.product_img.image_url(:thumb)
		end
	end

	def image_limit_logic(product)
		if product.max?
			"Max 3 images allowed!"
		else
			link_to t('.new', :default => t("helpers.links.add_images")),
            new_product_product_image_path(@product),
            :class => 'btn btn-primary'
		end
	end

	 def format_average_stars(product)
    if product.average_stars.nil?
      content_tag(:strong, 'No reviews')
     else
     content_tag(:strong, '*' * product.average_stars.round)
    end
	end

def count_comments(product)
		product.reviews.pluck(:comments).each do |product|
			product
		end
end


end
