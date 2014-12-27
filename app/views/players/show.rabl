object @player => false
attributes :id, :name, :points
child({:course_records => :records}, :object_root => false) do
  attributes :rank => :place
  node(:id){ |record| record.score.id }
  node(:played_at){ |record| record.date.to_i }
  node(:course){ |record| record.course.name }
end
