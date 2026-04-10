
# Always use Nominatim for seeding - no API key required
Geocoder.configure(
  lookup: :nominatim,
  use_https: true,
  timeout: 5,
  units: :km,
  always_raise: [],
)
