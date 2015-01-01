class Player < ActiveRecord::Base
  validates_uniqueness_of :name

  has_many :scores

  def self.find_or_create(name)
    p = Player.find_by_name(name)
    return p if p
    Player.new(:name => name)
  end

  def course_records
    @course_records ||= begin
      courses = scores.map{|s| s.game.course }.uniq
      records = courses.map{|c| c.records }.flatten
      records = records.select{|record| record.player == self}
    end
  end

  def points
    @points ||= begin
      p = scores.size
      course_records.each do |rec|
        p += 10 if rec.rank == 1
        p += 5 if rec.rank == 2
        p += 3 if rec.rank == 3
      end
      p
    end
  end
end
