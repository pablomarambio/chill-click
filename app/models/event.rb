class Event < ActiveRecord::Base
	has_many :votes
  attr_accessible :description, :name, :when, :picture
  has_and_belongs_to_many :users
end
