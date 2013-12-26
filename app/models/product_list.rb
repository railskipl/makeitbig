class ProductList < ActiveRecord::Base

 def self.json_tokens(query)
	list = where("name like ?", "%#{query}%")
 end

end
