class User < ActiveRecord::Base
  has_and_belongs_to_many :events
  has_many :votes
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

  def votes_casted event
    votes.where(event_id: event.id)
  end

  def votes_casted_include? event, user
    votes_casted(event).where(voted_user_id: user.id).any?
  end

  def vote_for event, user
    raise Application::DuplicatedVoteError if votes_casted_include? event, user
    v = Vote.new
    v.event = event
    v.voted_user_id = user.id
    v.user = self
    v.save!
  end

  class << self
  	def by_auth_code auth_code
  		where(auth_code: auth_code).first
  	end
  end
end
