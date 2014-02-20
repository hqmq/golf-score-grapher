PlayersBloodhound = new Bloodhound({
  datumTokenizer: function(d) { return Bloodhound.tokenizers.whitespace(d.value); },
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: '/players/%QUERY/autocomplete.json',
});

PlayersBloodhound.initialize();

$(function(){
  $('.player-select input[type=text]').typeahead(
      {highlight: true},
      {name: "players",
        displayKey: "name",
        source: PlayersBloodhound.ttAdapter()
      }
  );

  $(document).on('typeahead:selected', '.player-select', function(je, player){
    console.log(player);
    $(this).data('player', player);
    $(this).find('.player_guid').val(player.guid);
  });
});

