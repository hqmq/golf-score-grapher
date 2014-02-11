require 'securerandom'
class Player
  include Virtus.model

  attribute :guid, String, :default => ->(player, attr){ player.class.create_guid }
  attribute :name, String
  attribute :created_at, Time, :default => ->(player, attr){ Time.current }
  attribute :updated_at, Time, :default => ->(player, attr){ Time.current }

  def self.create_guid
    "PLA-#{SecureRandom.uuid}"
  end
end
