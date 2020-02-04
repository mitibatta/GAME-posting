class Post < ApplicationRecord
  
  validates :user_id, presence:true
  validates :image, presence:true
  validates :text, presence:true
  
  mount_uploader :image, ImageUploader
 
 
  belongs_to :user
end
