class Post < ApplicationRecord
  
  validates :user_id, presence:true
  validates :image, presence:true
  validates :text, presence:true
  
  mount_uploader :image, ImageUploader
 
  has_many :favorites
  belongs_to :user
  has_many :favorite_users, through: :favorites, source:'user'
end
