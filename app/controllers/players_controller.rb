class PlayersController < ::ApplicationController
  def create
    player = Player.new(
      :guid => player_params[:player].fetch(:guid, Player.create_guid),
      :name => player_params[:player][:name],
      :created_at => Time.zone.now,
      :updated_at => Time.zone.now,
    )
    directory.add(player)
    head :created
  end

  def show
    @player = directory.lookup_by_guid(params[:id])
  end

  private

  def player_params
    params.permit :player => [:name, :guid]
  end
end
