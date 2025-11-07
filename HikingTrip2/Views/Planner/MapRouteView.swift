import SwiftUI
import MapKit
import CoreLocation

struct MapRouteView: View {
    let route: MKRoute
    let origin: CLLocationCoordinate2D
    let destination: CLLocationCoordinate2D
    let trails: [Trail]

    @State private var position: MapCameraPosition = .automatic

    var body: some View {
        Map(position: $position) {
            // Polyline da rota
            MapPolyline(route.polyline)
                .stroke(.blue, lineWidth: 4)

            // Pins de origem e destino (Annotation é MapContent)
            Annotation("Origem", coordinate: origin) {
                VStack(spacing: 4) {
                    Image(systemName: "mappin.circle.fill")
                        .font(.title2)
                        .foregroundStyle(.green)
                    Text("Origem")
                        .font(.caption2)
                        .padding(2)
                        .background(.thinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }

            Annotation("Destino", coordinate: destination) {
                VStack(spacing: 4) {
                    Image(systemName: "mappin.circle.fill")
                        .font(.title2)
                        .foregroundStyle(.red)
                    Text("Destino")
                        .font(.caption2)
                        .padding(2)
                        .background(.thinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }

            // Pins das trilhas sugeridas
            ForEach(trails) { trail in
                let coord = CLLocationCoordinate2D(latitude: trail.coordinates.lat, longitude: trail.coordinates.lon)
                Annotation(trail.name, coordinate: coord) {
                    VStack(spacing: 4) {
                        Image(systemName: "figure.hiking")
                            .font(.headline)
                            .foregroundStyle(.orange)
                        Text(trail.name)
                            .font(.caption2)
                            .lineLimit(1)
                            .padding(2)
                            .background(.thinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                }
            }
        }
        .onAppear {
            // Ajusta a câmera para enquadrar a rota
            let rect = route.polyline.boundingMapRect
            position = .rect(rect)
        }
        .navigationTitle("Rota do Roteiro")
        .navigationBarTitleDisplayMode(.inline)
    }
}
