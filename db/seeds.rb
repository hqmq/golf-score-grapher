# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
db = Sequel::DATABASES.first

cd = CourseDirectory.new(db)
cd.add( Course.new(name: 'Trafalga Orem Lighthouse') )
cd.add( Course.new(name: 'Trafalga Orem Windmill') )
cd.add( Course.new(name: 'Mulligans Lighthouse') )
cd.add( Course.new(name: 'Cascade Arches') )
cd.add( Course.new(name: 'Cascade Falls') )
cd.add( Course.new(name: 'Trafalga Lehi Outdoor') )

dir = Directory.new(db)
dir.add( Player.new(name: 'Michael Ries') )
dir.add( Player.new(name: 'Jared Cook') )
dir.add( Player.new(name: 'Russell Stewart') )
dir.add( Player.new(name: 'Nate Priego') )
dir.add( Player.new(name: 'Chris Hopkins') )
dir.add( Player.new(name: 'Ny Peang') )
