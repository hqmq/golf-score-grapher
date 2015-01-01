object @game => false
attributes :id, :course_id
node(:course) { |game| game.course.name }
node(:played_at) { |game| game.played_at.to_i }
child(:scores, :object_root => false) do
  attributes :id, :player_id
  node(:holes){ |score| score.score_array }
  node(:name){ |score| score.player.name }
end
