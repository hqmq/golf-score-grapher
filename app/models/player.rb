class Player < ActiveRecord::Base
  attr_accessible :name

  validates_uniqueness_of :name

  has_many :scores

  def self.find_or_create(name)
  	p = Player.find_by_name(name)
  	return p if p
  	Player.new(:name => name)
  end
end
