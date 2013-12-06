class Review < ActiveRecord::Base
  belongs_to :product
  validates :name, presence: true
  STARS = [1, 2, 3, 4, 5]
  COMMENTS = ["Excellent Product & Store has Latest Availability of Products",
"Good Product & Store has Competitive Price",
"Good Collection",
"Not Satisfactory with products or collection",
"No stock but still show available on store"
]

	validates :stars, inclusion: {
  	in: STARS,
  	message: "must be between 1 and 5"
	}

	# def average_comments
	# 	Review::COMMENTS[0].count
	# end

end
