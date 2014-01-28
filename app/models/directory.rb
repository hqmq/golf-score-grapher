class Directory
  def initialize(pg_connection)
    @pg = pg_connection
  end

  def add(player)
    pg.exec_params(
      'INSERT INTO players (guid, name, created_at, updated_at)' \
        'VALUES ($1, $2, $3, $4)',
      [player.guid, player.name, player.created_at, player.updated_at])
  end

  def lookup_by_guid(guid)
    res = pg.exec_params(
      'SELECT players.* FROM players WHERE guid = $1',
      [guid])
    ::Player.new( res.first )
  end

  private
  attr_reader :pg

end
