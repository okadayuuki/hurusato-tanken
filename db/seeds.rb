# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(:name => '一郎', :email =>'a@a' , :password => 'aaaaaa', :eria_id => 1)
user2 = User.create!(:name => '二郎', :email =>'b@b' , :password => 'bbbbbb', :eria_id => 10)
user3 = User.create!(:name => '三郎', :email =>'c@c' , :password => 'cccccc', :eria_id => 17)
user4 = User.create!(:name => '四郎', :email =>'d@d' , :password => 'dddddd', :eria_id => 26)
user5 = User.create!(:name => '五郎', :email =>'e@e' , :password => 'eeeeee', :eria_id => 36)
user6 = User.create!(:name => '太郎', :email =>'f@f' , :password => 'ffffff', :eria_id => 41)

