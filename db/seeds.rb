# require libraries
require 'faker'
require 'open-uri'
# Line below destroys all booking and pets, everytime we run the seed file so no duplicates are created

# Helper to safely attach remote photos — skips on download/upload errors
def safe_attach(pet, url)
  # Skip networked attachments when Cloudinary isn't configured.
  # Accept either correct `CLOUDINARY_URL` or common misspelling `CLOUDNINARY_URL`.
  cloudinary_present = !(ENV['CLOUDINARY_URL'].to_s.strip.empty?) || !(ENV['CLOUDNINARY_URL'].to_s.strip.empty?)
  unless cloudinary_present
    puts "CLOUDINARY_URL not set — skipping remote photo attach for #{pet.name}"
    return
  end

  begin
    file = URI.open(url)
    pet.photo.attach(io: file, filename: File.basename(URI.parse(url).path), content_type: 'image/png')
    pet.save!
    puts "attached photo for #{pet.name}"
  rescue => e
    puts "Skipping photo attach for #{pet.name}: #{e.class} - #{e.message}"
  end
end
# Review.destroy_all
Booking.destroy_all
Pet.destroy_all

#creating users

10.times do
  name = Faker::Name.unique.name.split
  first_name = name.first
  last_name = name.last
  User.create!(
    email: Faker::Internet.email,
    first_name: first_name,
    last_name: last_name,
    password: 'password'
  )
end
# Below needs to be sorted
10.times do
  Species.create!(name: Faker::Creature::Animal.name)
end
# Species giving major issues as we all know, so creating species below.

# creating Random Pets
# 10.times do
#   puts 'creating pet'
#   pet = Pet.create!(
#     name: Faker::Superhero.name,
#     age: (1..20).to_a.sample,
#     address: Faker::Address.street_address,
#     price: [50, 100, 150, 200, 250, 300, 350, 400, 450, 500].sample,
#     species: Species.all.sample,
#     user: User.all.sample
#   )
#   puts "finished creating #{pet.id} pet"
# end
#  creating pets for demo

    puts 'creating pet'
      pet1 = Pet.create!(
        name: "Bixby",
        age: 7,
        address: "131-133 Gooshays Dr, Romford RM3 8AE",
        price: [50, 100, 150, 200, 250, 300, 350, 400, 450, 500].sample,
        # species: Species.all.sample,
        species: Species.create!(name: "cat"),
        user: User.all.sample
      )
      puts "finished creating #{pet1.id} pet"

      safe_attach(pet1, 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y3V0ZSUyMGNhdHxlbnwwfHwwfHw%3D&w=1000&q=80')

      puts 'creating pet'


      pet2 = Pet.create!(
        name: "Slothie",
        age: 4,
        address: "Park Lane
        London",
        price: [50, 100, 150, 200, 250, 300, 350, 400, 450, 500].sample,
        species: Species.create!(name: "Sloth"),
        user: User.all.sample
      )
      puts "finished creating pet"

      safe_attach(pet2, 'https://ichef.bbci.co.uk/images/ic/1040x1040/p03t268b.jpg')

      gerbil = Species.create!(name: "Gerbil")
      pet3 = Pet.create!(
        name: "Harper",
        age: 4,
        address: "1 hornshay street se15 1hb",
        price: 100,
        species: Species.create!(name: "Fox Pet"),
        user: User.all.sample
      )

      puts "finished creating pet"

      safe_attach(pet3, 'https://media.wired.com/photos/593261cab8eb31692072f129/4:3/w_929,h_697,c_limit/85120553.jpg')


      pet4 = Pet.create!(
        name: "Rain",
        age: 1,
        address: "Kipling Estate, London SE1 3RL",
        price: [50, 100, 150, 200, 250, 300, 350, 400, 450, 500].sample,
        species: Species.create!(name: "Rabbit"),
        user: User.all.sample
      )
      puts "finished creating pet"

      safe_attach(pet4, 'https://navs.org/wp-content/uploads/bb-plugin/cache/bunny-landscape.jpg')

      pet5 = Pet.create!(
        name: "Lily",
        age: 4,
        address: "31 Jewry St, London EC3N 2ET",
        price: [50, 100, 150, 200, 250, 300, 350, 400, 450, 500].sample,
        species: Species.create!(name: "Pig"),
        user: User.all.sample
      )
      puts "finished creating pet"

      safe_attach(pet5, 'https://static.boredpanda.com/blog/wp-content/uuuploads/cute-baby-animals/cute-baby-animals-10.jpg')

      pet6 = Pet.create!(
        name: "Belle",
        age: 4,
        address: "10 Whitechapel High St, London E1 8QS",
        price: [50, 100, 150, 200, 250, 300, 350, 400, 450, 500].sample,
        species: Species.create!(name: "Meerkat"),
        user: User.all.sample
      )
      puts "finished creating pet"

      safe_attach(pet6, 'https://www.zsl.org/sites/default/files/styles/leader/public/image/2015-03/ZSL-Lemur-Sidebars---10.jpg?itok=xNlm9g0O')

      pet7 = Pet.create!(
        name: "Maverick",
        age: 4,
        address: "Cambridge Heath, London",
        price: [50, 100, 150, 200, 250, 300, 350, 400, 450, 500].sample,
        species: Species.create!(name: "Lamb"),
        user: User.all.sample
      )
      puts "finished creating pet"

      safe_attach(pet7, 'https://aldf.org/wp-content/uploads/2018/05/lamb-iStock-665494268-16x9-e1559777676675-1200x675.jpg')

      pet8 = Pet.create!(
        name: "Snowball",
        age: 13,
        address: "29 cosway street",
        price: [50, 100, 150, 200, 250, 300, 350, 400, 450, 500].sample,
        species: Species.create!(name: "Parrot"),
        user: User.all.sample
      )
      puts "finished creating pet"

      safe_attach(pet8, 'https://lafeber.com/pet-birds/wp-content/uploads/2020/04/gamaliel-troubleson-u9PsLITXMCQ-unsplash-e1587001975887.jpg')

      pet9 = Pet.create!(
        name: "Boston",
        age: 1,
        address: "ashmill street london",
        price: [50, 100, 150, 200, 250, 300, 350, 400, 450, 500].sample,
        species: Species.create!(name: "Dog"),
        user: User.all.sample
      )
      puts "finished creating pet"

      safe_attach(pet9, 'https://s36700.pcdn.co/wp-content/uploads/2019/11/2102_Boston-puppy_Getty166523625.png')

      puts 'creating pet'

      pet1 = Pet.create!(
        name: "Brandy",
        age: 7,
        address: "nutford place london",
        price: [50, 100, 150, 200, 250, 300, 350, 400, 450, 500].sample,
        # species: Species.all.sample,
        species: Species.create!(name: "cat"),
        user: User.all.sample
      )
      puts "finished creating #{pet1.id} pet"

      safe_attach(pet1, 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y3V0ZSUyMGNhdHxlbnwwfHwwfHw%3D&w=1000&q=80')

      puts 'creating pet'

      pet2 = Pet.create!(
        name: "Sammie",
        age: 4,
        address: "brick lane london",
        price: [50, 100, 150, 200, 250, 300, 350, 400, 450, 500].sample,
        species: Species.create!(name: "Sloth"),
        user: User.all.sample
      )
      puts "finished creating pet"

      safe_attach(pet2, 'https://ichef.bbci.co.uk/images/ic/1040x1040/p03t268b.jpg')

      pet3 = Pet.create!(
        name: "Pixie",
        age: 4,
        address: "augusta street london",
        price: 100,
        species: Species.create!(name: "Fox Pet"),
        user: User.all.sample
      )

      puts "finished creating pet"

      safe_attach(pet3, 'https://media.wired.com/photos/593261cab8eb31692072f129/4:3/w_929,h_697,c_limit/85120553.jpg')

      pet4 = Pet.create!(
        name: "Lento",
        age: 1,
        address: "Cadogan gardens",
        price: [50, 100, 150, 200, 250, 300, 350, 400, 450, 500].sample,
       species: Species.create!(name: "Rabbit"),
        user: User.all.sample
      )
      puts "finished creating pet"

      safe_attach(pet4, 'https://navs.org/wp-content/uploads/bb-plugin/cache/bunny-landscape.jpg')

      pet5 = Pet.create!(
        name: "Tilly",
        age: 4,
        address: "ellen street london",
        price: [50, 100, 150, 200, 250, 300, 350, 400, 450, 500].sample,
        species: Species.create!(name: "Pig"),
        user: User.all.sample
      )
      puts "finished creating pet"

      safe_attach(pet5, 'https://blog.mystart.com/wp-content/uploads/My_Baby_Pigs_00.jpeg')

      pet6 = Pet.create!(
        name: "Belle",
        age: 4,
        address: "commercial road london",
        price: [50, 100, 150, 200, 250, 300, 350, 400, 450, 500].sample,
        species: Species.create!(name: "Meerkat"),
        user: User.all.sample
      )
      puts "finished creating pet"

      safe_attach(pet6, 'https://winghamwildlifepark.co.uk/wp-content/uploads/2021/07/Meerkats-17.jpg')

      pet7 = Pet.create!(
        name: "Damsie",
        age: 4,
        address: "162 Eversholt St, London NW1 1BL",
        price: [50, 100, 150, 200, 250, 300, 350, 400, 450, 500].sample,
        species: Species.create!(name: "Lamb"),
        user: User.all.sample
      )
      puts "finished creating pet"

      safe_attach(pet7, 'https://th-thumbnailer.cdn-si-edu.com/ld5JS46qcgf1IUAuonJdBiaSudg=/1072x720/filters:no_upscale()/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/b5/74/b5746db4-5bfe-4e77-8d65-e3098f1b8f24/lamb.jpg')

      pet8 = Pet.create!(
        name: "Lee",
        age: 13,
        address: "Cadogan gardens",
        price: [50, 100, 150, 200, 250, 300, 350, 400, 450, 500].sample,
        species: Species.create!(name: "Parrot"),
        user: User.all.sample
      )
      puts "finished creating pet"

      safe_attach(pet8, 'https://www.thesprucepets.com/thmb/i7WQGhM_FSpszuPA1d-OtD71nak=/3865x2576/filters:no_upscale():max_bytes(150000):strip_icc()/close-up-of-gold-and-blue-macaw-perching-on-tree-962288862-5b50073e46e0fb0037c23c23.jpg')

      pet9 = Pet.create!(
        name: "Richie",
        age: 1,
        address: "120 Eversholt St, London NW1 1BL",
        price: [50, 100, 150, 200, 250, 300, 350, 400, 450, 500].sample,
        species: Species.create!(name: "Dog"),
        user: User.all.sample
      )
      puts "finished creating final pet"

      safe_attach(pet9, 'https://i.insider.com/5484d9d1eab8ea3017b17e29?width=600&format=jpeg&auto=webp')
