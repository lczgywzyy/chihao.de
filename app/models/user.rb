class User < ActiveRecord::Base
  has_many :restaurant
  has_and_belongs_to_many :course
  has_many :assignments, :through => :courses
  
  has_many :order
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login
  
  validates :name,  :uniqueness => { :case_sensitive => false },
                    presence: true, 
                    length: 5..100,
                    exclusion: { in: %w(admin superuser administrator superroot) }
  validates :email, :uniqueness => { :case_sensitive => false }, presence: true
   
  
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
  
end
