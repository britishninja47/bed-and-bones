
# Use test lookup for development to avoid API issues
Geocoder.configure(
  lookup: :test,
  use_https: true,
  timeout: 5,
  units: :km,
  always_raise: [],
)
