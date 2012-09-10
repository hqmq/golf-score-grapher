module GamesHelper
  def linegraph(width, height, x_axis_data, y_axis_data)
    name = Random.rand(100000..999999)
    
    html = " <div id='#{name}' style='height:#{height}px; width:#{width}px;' class='linegraph'></div>
    <script>
    	var r = Raphael('#{name}');
    	var x = #{x_axis_data.to_json.html_safe};
    	var y = #{y_axis_data.to_json.html_safe};
    	var options = { nostroke: false, axis: '0 0 1 1', symbol: 'circle', smooth: true };
    	var lines = r.linechart(10, 10, #{width-20}, #{height-20}, x, y, options).hoverColumn(function () {
        this.tags = r.set();

        for (var i = 0, ii = this.y.length; i < ii; i++) {
            this.tags.push(r.tag(this.x, this.y[i], this.values[i], 160, 10).insertBefore(this).attr([{ fill: '#fff' }, { fill: this.symbols[i].attr('fill') }]));
        }
      }, function () {
        this.tags && this.tags.remove();
      });
    	lines.symbols.attr({ r: 6 });
    </script>".html_safe
  end

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
