class User < ApplicationRecord

  has_many :reviews
  has_many :comments
  has_many :bookmarks

  mount_uploader :avatar, PhotoUploader
  
  has_secure_password
  validates :username, presence:true, uniqueness:true
  validates :email, presence:true, uniqueness:true

  def to_param
    username
  end 

end
