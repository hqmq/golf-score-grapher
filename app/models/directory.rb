class Directory
  def most_awesome(how_many = 10)
    Player.order(:created_at => :asc).limit(how_many).to_a
  end
end
