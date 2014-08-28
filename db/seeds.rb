# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.destroy_all
User.create(email: 'a@a.com', password: '123456789', password_confirmation: '123456789')
Post.create(title: 'Hello world', picture: File.new(Rails.root.join('spec/images/pear_programming_250.png')), user_id: User.first.id)
Post.create(title: 'Hello world', picture: File.new(Rails.root.join('spec/images/pear_programming_250.png')), user_id: User.first.id)
Post.create(title: 'Hello world', picture: File.new(Rails.root.join('spec/images/pear_programming_250.png')), user_id: User.first.id)