class Directory < ::DM
  def add(player)
    db[:players].insert(player.attributes)
  end

  def lookup_by_guid(guid)
    res = db[:players].where(:guid => guid).first
    ::Player.new(res)
  end
end
