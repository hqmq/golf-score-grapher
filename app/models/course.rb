require 'securerandom'
class Course
  include Virtus.model
  include Equalizer.new(:guid, :name, :created_at, :updated_at)

  attribute :guid, String, :default => ->(course, attr){ course.class.create_guid }
  attribute :name, String
  attribute :created_at, Time, :default => ->(course, attr){ Time.current }
  attribute :updated_at, Time, :default => ->(course, attr){ Time.current }

  def self.create_guid
    "CRS-#{SecureRandom.uuid}"
  end
end
