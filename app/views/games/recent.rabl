collection @games, :object_root => false
attributes :id
node(:course) { |game| game.course.name }
node(:played_at) { |game| game.played_at.to_i }
