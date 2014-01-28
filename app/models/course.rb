require 'securerandom'
class Course
  include Virtus.value_object

  values do
    attribute :guid, String
    attribute :name, String
    attribute :created_at, Time
    attribute :updated_at, Time
  end

  def self.create_guid
    "CRS-#{SecureRandom.uuid}"
  end
end
