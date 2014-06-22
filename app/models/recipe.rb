class Recipe < ActiveRecord::Base
  belongs_to :restaurant
  validates :name,          presence: true
  validates :restaurant_id, presence: true 
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "200x200>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  
  #mount_uploader :avatar, AvatarUploader
end
