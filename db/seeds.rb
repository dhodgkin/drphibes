# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :username => 'admin', :fname => 'Admini', :lname => 'Strator', :bio => 'I am the creator of this site.', :imcanvas => true, :imartist => false, :admin => true, :email => 'admin@tatzoo.com', :password => 'password', :password_confirmation => 'password'
puts 'New user created: ' << user.username

puts 'SETTING UP EXAMPLE POSTS'
post = Post.create! :post_content => 'This is an example post 1', :user_id => 1
puts 'Example post created: ' << post.post_content
post = Post.create! :post_content => 'This is an example post 2', :user_id => 1
puts 'Example post created: ' << post.post_content
post = Post.create! :post_content => 'This is an example post 3', :user_id => 1
puts 'Example post created: ' << post.post_content
