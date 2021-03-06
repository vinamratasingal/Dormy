class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :encrypted_password
  belongs_to :dorm
  belongs_to :school
  attr_accessible :name, :dorm_id, :school_id
  validates :email, :format => { :with => /.*@stanford.edu$/, :message => "must be a Stanford email address"}  
  
  def self.search(name)
    where('name LIKE ?', "%#{name}%")
  end 

end
