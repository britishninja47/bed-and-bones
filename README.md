# 🐶 Bed & Bones - Pawsome Pet Playdate Paradise! 🦴✨

Hey there! 👋 I'm a super excited **junior developer** diving headfirst into Rails, and I built **Bed & Bones** – the ultimate spot where your furry besties can crash, play, and make new pals while you're out conquering the world!

Imagine: Drop your doggo, kitty, or even that cheeky parrot for epic sleepovers, walks in the park, or just chill vibes. Owners list their pets with cute pics, live maps, and all the deets. Bookers search, snag a spot, leave glowing reviews – it's a tail-waggin' good time! 🎉

## 🚀 What Makes It Fun?
- **Pet Profiles** 🌟: Upload photos, add species (dogs, cats, birds – you name it!), pin locations with Mapbox magic.
- **Super Search** 🔍: Find nearby furballs with geolocation & full-text search.
- **Booking Bliss** 📅: Easy bookings, owner dashboards (`/my_pets`), sitter views (`/my_bookings`).
- **Review Party** 💬: Rate your pet-sitting adventures!
- **Secure & Slick** 🔐: Devise login, Cloudinary images, SweetAlert pop-ups – all polished!

![San Francisco pups ready for fun!](san_francisco.jpg)

## 🎮 Live Demo Vibes
- **Home** `/`: Welcome to the pack!
- **Pet Map** `/pets`: Zoom around for perfect matches.
- **Owner Dash** `/my_pets`: Manage your crew.
- **Bookings** `/my_bookings`: Track the fun.

## 🛠️ Super Easy Setup (Junior-Proof!)
```bash
bundle install
rails db:create db:migrate db:seed
# Pro tip: Add your MAPBOX_API_KEY & CLOUDINARY_URL to ENV
rails s -p 3000
```
Open http://localhost:3000 – woof! 🚀

**Built with love in Rails 7, Stimulus, Turbo, PostgreSQL. First big solo project – critiques welcome! 🐕💕**

**Star it, fork it, let's make pets happier together!** ⭐
