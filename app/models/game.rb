require 'csv'
require 'narray'

class Game < ActiveRecord::Base
  attr_accessible :name, :played_at, :scores
  
  validates_presence_of [:name, :played_at, :scores]
  validates_uniqueness_of :played_at, :message => "duplicate value"
  
  def scores_hash
    @scores_hash ||= CSV.parse( self.scores, :headers => true).map {|rec| rec.to_hash }.sort_by{|obj| [obj["TOT"], obj["Player"]]}
    @scores_hash
  end
  
  def all_scores
    scores_hash.map{|rec| rec.select{|key,val| key =~ /^H\d+/}.map{|hole, score| score} }
  end
  
  def all_running_totals
    scores_hash.map do |rec| 
      total = 0
      rec.select{|key,val| key =~ /^H\d+/}.map{|hole, score| total += score.to_i }
    end
  end
  
  def all_average_scores
    holes = 0.upto(self.holes.size-1).to_a
    totals = all_running_totals
    averages = NArray.int(num_holes) + holes.map{|i| totals.inject(0){|sum, scores| sum += scores[i]} / totals.size }
    totals.map do |scores|
      na = NArray.int(num_holes) + scores
      (na - averages).to_a
    end
  end
  
  def holes
    scores_hash.first.select{|key,val| key =~ /^H\d+/ }.map{|hole, score| hole}
  end
  
  def num_holes
    holes.size
  end
end
