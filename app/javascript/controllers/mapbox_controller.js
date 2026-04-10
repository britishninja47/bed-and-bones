import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"
import L from "leaflet"

export default class extends Controller {
  static values = { apiKey: String, markers: Array }

  connect() {
    // Always use Leaflet for simplicity
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
