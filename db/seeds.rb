# require libraries
require 'faker'
require 'open-uri'

# Destroy records
Booking.destroy_all
Pet.destroy_all

# Helper - skip photos during seeding
def safe_attach(pet, url)
  puts "Skipping photo for #{pet.name} (seeding - no Cloudinary)"
end

# Create users
10.times do
  name = Faker::Name.name.split
  User.create!(
    email: Faker::Internet.email,
    first_name: name[0],
    last_name: name[1],
    password: 'password'
  )
end

# Create species
%w[cat dog rabbit pig sloth meerkat lamb parrot fox].each do |name|
  Species.create!(name: name)
end

# Create pets (no geocoding during seed)
pets_data = [
  { name: "Bixby", age: 7, address: "131 Gooshays Dr, Romford", price: 50, species_name: "cat" },
  { name: "Slothie", age: 4, address: "Park Lane, London", price: 80, species_name: "sloth" },
  { name: "Harper", age: 4, address: "1 Hornsey St, London", price: 100, species_name: "fox" },
  { name: "Rain", age: 1, address: "Kipling Estate, London", price: 60, species_name: "rabbit" },
  { name: "Lily", age: 4, address: "31 Jewry St, London", price: 120, species_name: "pig" },
  { name: "Belle", age: 4, address: "10 Whitechapel High St", price: 90, species_name: "meerkat" },
  { name: "Maverick", age: 4, address: "Cambridge Heath", price: 75, species_name: "lamb" },
  { name: "Snowball", age: 13, address: "29 Cosway St", price: 40, species_name: "parrot" },
  { name: "Boston", age: 1, address: "Ashmill St", price: 110, species_name: "dog" },
  { name: "Brandy", age: 7, address: "Nutford Place", price: 55, species_name: "cat" }
]

pets_data.each do |data|
  pet = Pet.create!(
    name: data[:name],
    age: data[:age],
    address: data[:address],
    price: data[:price],
    species: Species.find_by(name: data[:species_name]),
    user: User.all.sample
  )
  safe_attach(pet, '')
end

puts "✅ Seeding complete! #{User.count} users, #{Pet.count} pets, #{Species.count} species"

# Geocode after seeding (async)
Pet.find_each do |pet|
  pet.geocode unless pet.geocoded?
end

puts "✅ Geocoding queued!"
