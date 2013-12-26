//Client side validation  
jQuery(document).ready(function() {
	//validation for tasks form
  jQuery("#new_product").validate({
	errorElement:'div',
	rules: {
	  "product[category_id]":{
	 				  required: true
				}						
		
			
	
		},
	messages: {
	"product[category_id]":{
					  required: "Category cannot be blank"
					 
				}	
		}
	});
	
	  
	
});
	