
# Bed & Bones - Pet Booking Platform

## Features
- User auth (Devise)
- Pet listings with photos, maps
- Bookings, reviews
- Mapbox + geolocation

## Setup
```
bundle install
rails db:create db:migrate db:seed
# Add ENV: MAPBOX_API_KEY, CLOUDINARY_URL
rails s
```

## Pages
- / : Home
- /pets : Map + search
- /my_pets : Owner dashboard
- /my_bookings : User bookings

**Fully functional!**
