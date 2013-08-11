class Ability
  include CanCan::Ability

  def initialize(user)
  	user ||= User.new
    can :browse_attendees, Event do |e|
    	e.users.include? user
    end
  end
end
