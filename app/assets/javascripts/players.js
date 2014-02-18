PlayersBloodhound = new Bloodhound({
  datumTokenizer: function(d) { return Bloodhound.tokenizers.whitespace(d.value); },
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: '/players.json',
});

PlayersBloodhound.initialize();

$(function(){
  $('.player-select input').typeahead(
      {highlight: true},
      {name: "players",
        displayKey: "name",
        source: PlayersBloodhound.ttAdapter()
      }
  );
});

