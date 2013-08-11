class User < ActiveRecord::Base
  has_and_belongs_to_many :events
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :registerable, :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :remember_me
  attr_accessible :cellphone, :mail, :name, :picture

  def set_auth_code
  	self.auth_code = rand(1..99999999999999999999999).to_s 32
  end

  class << self
  	def by_auth_code auth_code
  		where(auth_code: auth_code).first
  	end
  end
end
