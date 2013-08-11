class User < ActiveRecord::Base
  attr_accessible :cellphone, :mail, :name, :picture
end
