module CoursesHelper
  def linegraph_calculated_par(dom_id, course)
    par = course.calculated_par
    data_grid = [1.upto(par.size).to_a, par].transpose.unshift(["hole","par"])
    js = "
      <script type='text/javascript'>
        var d = $('\##{dom_id}');
        
        var dc = function(){
          d.empty();
          var data = google.visualization.arrayToDataTable(#{data_grid.to_json});
          var options = {
            curveType: 'function',
            width: 570,
            height: 300
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
end
