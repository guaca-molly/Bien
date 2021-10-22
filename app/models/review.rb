class Review < ApplicationRecord

  #add an association that has a one to many relationship
  has_many :comments
  has_many :bookmarks
  #add an association to the user 
  belongs_to :user

  geocoded_by :address
  after_validation :geocode


  validates :title, presence: true
  validates :body, length: { minimum: 10 }
  validates :score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :restaurant, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 3 }
  validates :address, presence: true
  profanity_filter :body

  def to_param
    id.to_s + "-" + title.parameterize
  end



end
