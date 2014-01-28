require 'securerandom'
class Player
  include Virtus.model

  attribute :guid, String
  attribute :name, String
  attribute :created_at, Time
  attribute :updated_at, Time

  def self.create_guid
    "PLA-#{SecureRandom.uuid}"
  end
end
