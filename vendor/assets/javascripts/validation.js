//Client side validation  
jQuery(document).ready(function() {
	//validation for tasks form
  jQuery("#new_product").validate({
	errorElement:'div',
	rules: {
	  "product[category_id]":{
	 				  required: true
				}	,					
		
		 "product[name]":{
	 				  required: true
				},
		"product[description]" : {
				required: true
		},
		"product[price]" :{
			required: true,
			number:true
		}						
			
	
		},
	messages: {
	"product[category_id]":{
					  required: "Category cannot be blank"
					 
				}	
		}
	});

 //  jQuery("#new_subscriber").validate({
	// errorElement:'div',
	// rules: {
	//   "subscriber[email]":{
	//  				  required: true,
	//  				  email: true,
	//  				  remote:"/subscribers/validations/check_email"
	// 			}	,					
		
	//   "subscriber[city]":{
	//  				  required: true
	//      		}	
	
	// 	},
	// messages: {
	// "subscriber[email]":{
	// 	              required: "Please enter email address",
	// 				  email: "Please enter valid email id",
	//  				  remote: "Email Already Exists"
	// 			}	,				
		
	//   "subscriber[city]":{
	//      		}	
	
	// 	}
	// });
	
	  
	
});
	