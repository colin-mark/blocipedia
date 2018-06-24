require 'random_data'

#Create Users
20.times do
  User.create!(
  username: RandomData.random_word,
  email:    RandomData.random_email,
  password: RandomData.random_sentence,
  role: RandomData.random_role
  )
end
users = User.all

# Create Wikis
20.times do
  Wiki.create!(
    user:     users.sample,
    title:    RandomData.random_sentence,
    body:     RandomData.random_paragraph,
    private:  RandomData.random_boolean
  )
end
wikis = Wiki.all

# Create Collaborators
20.times do
  Collaborator.create!(
    user_id: users.ids.sample,
    wiki_id: wikis.ids.sample
  )
end
collaborators = Collaborator.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
puts "#{Collaborator.count} collaborators created"
