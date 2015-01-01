collection @games, :object_root => false
attributes :id
node(:course) { |game| game.course.name }
node(:course_id) { |game| game.course.id }
node(:played_at) { |game| game.played_at.to_i }
