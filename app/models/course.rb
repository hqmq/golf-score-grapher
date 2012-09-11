class Course < ActiveRecord::Base
  attr_accessible :name

  validates_uniqueness_of :name

  has_many :games

  def self.find_or_create(name)
  	c = Course.find_by_name(name)
  	return c if c
  	Course.new(:name => name)
  end
end
