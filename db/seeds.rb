# require 'faker'
puts "🌱 Seeding spices..."

# Seed your database here


# Create 10 users with random names and phone numbers
10.times do
  User.create(
    name: Faker::Name.name, 
    phone_number: Faker::PhoneNumber.phone_number)
end

# Create 20 pets with random names, breeds, ages, and owners
20.times do
  Pet.create(
    name: Faker::Creature::Dog.name, 
    breed: Faker::Creature::Dog.breed, 
    age: rand(1..10), 
    user_id: rand(1..10))
end


puts "✅ Done seeding!"
