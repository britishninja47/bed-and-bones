# 🐶 Bed & Bones - Pawsome Pet Playdate Paradise! 🦴✨

Hey there! 👋 I'm a super excited **junior developer** and my team, and I built **Bed & Bones** – the ultimate spot where you can book and rent out animal besties to play, take care of and make new pals!

Imagine: Drop your shark, dog, or even that cheeky parrot for epic sleepovers, walks/flights in the park, or just chill vibes. Owners list their pets with cute pics, live maps, and all the deets. Bookers search, snag a spot, leave glowing reviews – it's all a good time! 🎉

## 🚀 What Makes It Fun?
- **Pet Profiles** 🌟: Upload photos, add species (dogs, cats, birds – you name it!), pin locations with Mapbox magic.
- **Super Search** 🔍: Find nearby furballs with geolocation & full-text search.
- **Booking Bliss** 📅: Easy bookings, owner dashboards (`/my_pets`), sitter views (`/my_bookings`).
- **Review Party** 💬: Rate your pet-sitting adventures!
- **Secure & Slick** 🔐: Devise login, Cloudinary images, SweetAlert pop-ups – all polished!

<img width="1510" height="834" alt="Screenshot 2026-04-10 at 13 43 55" src="https://github.com/user-attachments/assets/91a5a1c7-53a4-44f2-ba00-098f3e0c2d9f" />


(Project is still in development)

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

**Built with love in Rails 7, Stimulus, Turbo, PostgreSQL. First big group project – critiques welcome! 🐕💕**

**let's make pets happier!** ⭐
