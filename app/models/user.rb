class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
#  devise :database_authenticatable, :registerable,
 #        :recoverable, :rememberable, :trackable, :validatable
	has_secure_password
	has_many :messages
	has_many :photos
	validates_uniqueness_of :email

	
end
