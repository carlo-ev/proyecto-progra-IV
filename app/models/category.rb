class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :groups
	
end
