# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
2.times do |n|
  User.create(email:"admin#{n}@hoge.com",password:'11111111',name: "admin_user#{n+1}",admin: true, confirmed: true)
end

5.times do |n|
  User.create(email:"user#{n}@hoge.com",password:'11111111',name: "test_user#{n+1}",admin: false, confirmed: true)
end
