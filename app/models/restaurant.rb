class Restaurant < ActiveRecord::Base
  has_many   :recipe
  belongs_to :user
  
  validates :name,   presence:true 
  validates :phone1, presence:true, format:{ with: /\A[0-9\-]*\z/, on: :create}
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "200x200>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  

end
