//Client side validation  
jQuery(document).ready(function() {
	//validation for tasks form
  jQuery("#new_product").validate({
	errorElement:'div',
	rules: {
	  "product[category_id]":{
	 				  required: true
				},
	 "product[subcategory_id]":{
	 				  required: true
	 				 
				},
    "product[name]" :{
                    required: true
                    
    }						
		
			
	
		},
	messages: {
	"product[category_id]":{
					  required: "Category cannot be blank"
					 
				},
	"product[subcategory_id]":{
					  required: "Sub-Category cannot be blank"
				},
    "product[name]" :{
                    required: "Field Cannot be blank"
    }
			
		}
	});
	
	  
	
});
	