class Ability
  include CanCan::Ability

  def initialize(user)
  	user ||= User.new
    can :read, Event do |e|
    	e.users.include? user
    end
  end
end
