# require libraries
require 'faker'
require 'open-uri'

# Destroy records
Booking.destroy_all
Pet.destroy_all

# Disable automatic geocoding for seed data
Pet.skip_callback(:validation, :after, :geocode)

# Helper - skip photos during seeding if remote image attach fails
def safe_attach(pet)
  puts "Skipping photo for #{pet.name} (seeding no attachment)"
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
  { name: "Bixby", age: 7, address: "Paris, France", latitude: 48.8566, longitude: 2.3522, price: 50, species_name: "cat" },
  { name: "Slothie", age: 4, address: "Berlin, Germany", latitude: 52.5200, longitude: 13.4050, price: 80, species_name: "sloth" },
  { name: "Harper", age: 4, address: "Tokyo, Japan", latitude: 35.6762, longitude: 139.6503, price: 100, species_name: "fox" },
  { name: "Rain", age: 1, address: "Sydney, Australia", latitude: -33.8688, longitude: 151.2093, price: 60, species_name: "rabbit" },
  { name: "Lily", age: 4, address: "New York, USA", latitude: 40.7128, longitude: -74.0060, price: 120, species_name: "pig" },
  { name: "Belle", age: 4, address: "Rio de Janeiro, Brazil", latitude: -22.9068, longitude: -43.1729, price: 90, species_name: "meerkat" },
  { name: "Maverick", age: 4, address: "Cape Town, South Africa", latitude: -33.9249, longitude: 18.4241, price: 75, species_name: "lamb" },
  { name: "Snowball", age: 13, address: "Moscow, Russia", latitude: 55.7558, longitude: 37.6173, price: 40, species_name: "parrot" },
  { name: "Boston", age: 1, address: "Mumbai, India", latitude: 19.0760, longitude: 72.8777, price: 110, species_name: "dog" },
  { name: "Brandy", age: 7, address: "Toronto, Canada", latitude: 43.6532, longitude: -79.3832, price: 55, species_name: "cat" }
]

pets_data.each do |data|
  pet = Pet.create!(
    name: data[:name],
    age: data[:age],
    address: data[:address],
    latitude: data[:latitude],
    longitude: data[:longitude],
    price: data[:price],
    species: Species.find_by(name: data[:species_name]),
    user: User.all.sample
  )
  safe_attach(pet)
end

puts "✅ Seeding complete! #{User.count} users, #{Pet.count} pets, #{Species.count} species"

# Restore geocoding callbacks after seeding
Pet.set_callback(:validation, :after, :geocode)

# Coordinates already set, no need to geocode
