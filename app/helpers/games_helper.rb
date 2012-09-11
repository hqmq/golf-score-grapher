module GamesHelper
  def linegraph_google(dom_id, game)
    data_grid = game.player_averages
      .map{ |ps| [ps[:player]].concat(ps[:averages]) }
      .transpose.each_with_index{ |row, idx| row.unshift(idx) }
    js = "
      <script type='text/javascript'>
        var d = $('\##{dom_id}');
        
        var dc = function(){
          d.empty();
          var data = google.visualization.arrayToDataTable(#{data_grid.to_json});
          var options = {
            curveType: 'function',
            width: 1170,
            height: 400
          };

          var chart = new google.visualization.LineChart(d.get(0));
          chart.draw(data, options);
        }
        if( google.visualization ) {
          $(function(){ dc(); });
        } else {
          google.load('visualization', '1', {packages:['corechart']});
          google.setOnLoadCallback(dc);
        }
      </script>
    ".html_safe
  end
  
  def legend_colors
    ["#3366cc","#dc3912","#ff9900","#109618","#990099","#0099c6","#dd4477","#66aa00"]
  end
end
