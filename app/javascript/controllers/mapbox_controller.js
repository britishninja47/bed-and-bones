import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"
import L from "leaflet"

export default class extends Controller {
  static values = { apiKey: String, markers: Array }

  connect() {
    if (this.apiKeyValue && this.apiKeyValue.trim() !== "") {
      mapboxgl.accessToken = this.apiKeyValue

      navigator.geolocation.getCurrentPosition(
        (position) => {
          this.userLat = position.coords.latitude
          this.userLng = position.coords.longitude

          if (this.map) {
            this.map.flyTo({
              center: [this.userLng, this.userLat],
              zoom: 12
            });
          }
        },
        () => {},
        { enableHighAccuracy: true }
      )

      this.map = new mapboxgl.Map({
        container: this.element,
        style: "mapbox://styles/mapbox/streets-v11",
        interactive: true
      })

      this.map.addControl(new mapboxgl.NavigationControl())
      this.map.addControl(new mapboxgl.FullscreenControl())
      this.map.addControl(new mapboxgl.GeolocateControl({
        positionOptions: { enableHighAccuracy: true },
        trackUserLocation: true
      }))

      this.#addMarkersToMap()
      this.#fitMapToMarkers()

      setTimeout(() => { this.map.resize() }, 200)
    } else {
      this.leafletMap = L.map(this.element).setView([20, 0], 2)
      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; OpenStreetMap contributors',
        maxZoom: 19
      }).addTo(this.leafletMap)

      if (this.markersValue && this.markersValue.length > 0) {
        this.markersValue.forEach((marker) => {
          const popupContent = marker.info_window || ''
          const icon = L.divIcon({
            className: 'custom-marker',
            html: `<div style="background-image:url('${marker.image_url}');background-size:contain;width:25px;height:25px"></div>`,
            iconSize: [25, 25]
          })

          L.marker([marker.lat, marker.lng], { icon: icon })
            .addTo(this.leafletMap)
            .bindPopup(popupContent)
        })

        const group = L.featureGroup(this.markersValue.map(m => L.marker([m.lat, m.lng])))
        this.leafletMap.fitBounds(group.getBounds(), { padding: [50, 50], maxZoom: 15 })
      }
    }
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)

      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "contain"
      customMarker.style.width = "25px"
      customMarker.style.height = "25px"

      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
