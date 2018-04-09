require 'faker'
# require 'random_data'

#Create Users
5.times do
  User.create!(
  email:    Faker::Internet.email,
  password: Faker::Internet.password(10, 20)
  )
end
users = User.all

# Create Wikis
50.times do
  wiki = Wiki.create!(
    user:     users.sample,
    title:    Faker::String.random(20..50),
    body:     Faker::String.random(20..500),
    private:  Faker::Boolean.boolean
  )
end
wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
