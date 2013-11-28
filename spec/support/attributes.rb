def store_attributes(overrides = {})
  {
		owner_name: "Kunal",
		email: "abc@example.com",
		address: "Hamel street, Liverpool",
		city: "Liverpool",
		state: "Merseyside",
		country: "UK",
		phone: "09876789"
	}.merge(overrides)
end

def user_attributes(overrides = {})
	{
		email: "abc@example.com",
		password: "abc123"
	}.merge(overrides)
end