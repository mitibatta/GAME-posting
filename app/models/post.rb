class Post < ApplicationRecord
  
  validates :user_id, presence:true
  validates :text, presence:true
  
  has_many :comments
  has_many :pictures
  has_many :favorites
  belongs_to :user
  has_many :favorite_users, through: :favorites, source:'user'
  has_many :comment_users, through: :comments, source:'user'
  
  accepts_nested_attributes_for :pictures
end
