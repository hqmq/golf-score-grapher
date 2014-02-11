# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
db = Sequel::DATABASES.first
cd = CourseDirectory.new(db)

cd.add( Course.new(name: 'Trafalga Orem Lighthouse', created_at: Date.current, updated_at: Date.current, guid: Course.create_guid) )
cd.add( Course.new(name: 'Trafalga Orem Windmill', created_at: Date.current, updated_at: Date.current, guid: Course.create_guid) )
cd.add( Course.new(name: 'Mulligans Lighthouse', created_at: Date.current, updated_at: Date.current, guid: Course.create_guid) )
cd.add( Course.new(name: 'Cascade Arches', created_at: Date.current, updated_at: Date.current, guid: Course.create_guid) )
cd.add( Course.new(name: 'Cascade Falls', created_at: Date.current, updated_at: Date.current, guid: Course.create_guid) )
cd.add( Course.new(name: 'Trafalga Lehi Outdoor', created_at: Date.current, updated_at: Date.current, guid: Course.create_guid) )
