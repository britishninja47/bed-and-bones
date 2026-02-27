if ENV['MAPBOX_API_KEY'].to_s.strip.empty?
  # No Mapbox API key — use Nominatim (OpenStreetMap) as a fallback for development.
  Geocoder.configure(
    lookup: :nominatim,
    use_https: true,
    timeout: 5,
    units: :km,
    always_raise: [],
  )
else
  # Use Mapbox when key is present (recommended for production and consistent results)
  Geocoder.configure(
    lookup: :mapbox,
    api_key: ENV['MAPBOX_API_KEY'],
    use_https: true,
    timeout: 5,
    units: :km,
    always_raise: [],
  )
end
