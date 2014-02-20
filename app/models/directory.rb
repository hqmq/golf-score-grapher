class Directory < ::DM
  def add(player)
    db[:players].insert(player.attributes)
  end

  def by_partial_name(partial)
    predicate = Sequel.ilike(:name, "%#{partial}%")
    res = db[:players].where(predicate).limit(5).select(:guid, :name)
    res.map{|res| ::Player.new(res) }
  end

  def lookup_by_guid(guid)
    res = db[:players].where(:guid => guid).first
    ::Player.new(res)
  end
end
