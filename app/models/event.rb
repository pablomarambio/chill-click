class Event < ActiveRecord::Base
  attr_accessible :description, :name, :when, :picture
  has_and_belongs_to_many :users
end
