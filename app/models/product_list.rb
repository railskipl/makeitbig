class ProductList < ActiveRecord::Base

 def self.json_tokens(query)
    list = where("name like ?", "%#{query}%")
    if list.empty?
      list
    else
      list
    end
  end
end
