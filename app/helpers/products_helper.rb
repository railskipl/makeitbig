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

end
