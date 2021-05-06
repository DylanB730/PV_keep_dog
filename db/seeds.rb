# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# Création de 'X' dogsitters :
5.times do
  dogsitter = Dogsitter.create(
    name: Faker::Name.name
  )
end

# Création de 'X' chiens :
10.times do
  dog = Dog.create(
    name: Faker::Creature::Dog.name,
    race: Faker::Creature::Dog.breed
  )
end

# Créations de 'X' balades :
10.times do
  rand_id_dogsitter = rand(1..Dogsitter.all.length)
  rand_id_dog = rand(1..Dog.all.length)
  stroll = Stroll.create(
    dogsitter: Dogsitter.find(rand_id_dogsitter),
    dog: Dog.find(rand_id_dog),
    date: Faker::Time.between(from: DateTime.now - 365, to: DateTime.now + 365, format: :short)
  )
end