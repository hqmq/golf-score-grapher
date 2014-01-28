class Directory
  def initialize(pg_connection)
    @pg = pg_connection
  end

  def add(player)
    pg.exec_params('INSERT INTO players (guid, name, created_at, updated_at) VALUES ($1, $2, $3, $4)', [player.guid, player.name, player.created_at, player.updated_at])
  end

  private
  attr_reader :pg

end
