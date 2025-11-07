//
//  trailDetailView.swift
//  HikingTrip2
//
//  Created by User on 07/11/25.
//

import SwiftUI
import MapKit
import CoreLocation

struct TrailDetailView: View {
    let trail: Trail

    @StateObject private var locationManager = LocationManager()
    @State private var isPushingRoute = false
    @State private var builtRoute: MKRoute?
    @State private var originCoord: CLLocationCoordinate2D?
    @State private var errorMessage: String?

    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: trail.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }

            VStack(alignment: .leading, spacing: 12) {
                Text(trail.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("\(trail.location), \(trail.country)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                HStack {
                    Label("\(trail.difficulty)", systemImage: "flame.fill")
                    Label("\(trail.length_km, specifier: "%.1f") km", systemImage: "ruler")
                    Label("\(trail.duration)", systemImage: "clock")
                }
                .font(.caption)
                .foregroundColor(.secondary)

                Divider()

                Text("⭐️ \(trail.rating, specifier: "%.1f") / 5.0")
                    .font(.headline)

                Text(trail.description)
                    .font(.body)
                    .padding(.top, 4)

                // Mapa estático do ponto
                Map(
                    coordinateRegion: .constant(
                        MKCoordinateRegion(
                            center: CLLocationCoordinate2D(
                                latitude: trail.coordinates.lat,
                                longitude: trail.coordinates.lon
                            ),
                            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
                        )
                    ),
                    annotationItems: [trail]
                ) { trail in
                    MapMarker(
                        coordinate: CLLocationCoordinate2D(
                            latitude: trail.coordinates.lat,
                            longitude: trail.coordinates.lon
                        ),
                        tint: .green
                    )
                }
                .frame(height: 200)
                .cornerRadius(10)

                // Botão: traçar rota até aqui
                Button {
                    errorMessage = nil
                    buildRouteToTrail()
                } label: {
                    HStack {
                        Image(systemName: "point.topleft.down.curvedto.point.bottomright.up")
                        Text("Traçar rota até aqui")
                            .bold()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                }
                .buttonStyle(.borderedProminent)
                .padding(.top, 8)

                if let errorMessage {
                    Text(errorMessage)
                        .font(.footnote)
                        .foregroundStyle(.red)
                }

                // Navegação programática para o MapRouteView quando a rota estiver pronta
                if let route = builtRoute, let origin = originCoord {
                    NavigationLink(
                        destination: MapRouteView(
                            route: route,
                            origin: origin,
                            destination: CLLocationCoordinate2D(latitude: trail.coordinates.lat, longitude: trail.coordinates.lon),
                            trails: [trail]
                        ),
                        isActive: $isPushingRoute
                    ) {
                        EmptyView()
                    }
                    .hidden()
                }
            }
            .padding()
        }
        .navigationTitle(trail.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            // Solicita permissão e começa a obter localização
            locationManager.requestWhenInUse()
        }
    }

    // MARK: - Rota
    private func buildRouteToTrail() {
        // Verifica autorização
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUse()
            errorMessage = "Precisamos da sua permissão de localização para traçar a rota."
            return
        case .denied, .restricted:
            errorMessage = "Permissão de localização negada. Habilite nas Ajustes para traçar a rota."
            return
        default:
            break
        }

        guard let userLocation = locationManager.currentLocation else {
            errorMessage = "Não foi possível obter sua localização atual. Tente novamente em alguns segundos."
            locationManager.startUpdating()
            return
        }

        let origin = userLocation.coordinate
        let destination = CLLocationCoordinate2D(latitude: trail.coordinates.lat, longitude: trail.coordinates.lon)

        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: origin))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
        request.transportType = .walking

        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            if let route = response?.routes.first {
                self.builtRoute = route
                self.originCoord = origin
                self.isPushingRoute = true
            } else if let error = error {
                self.errorMessage = "Falha ao calcular rota: \(error.localizedDescription)"
            } else {
                self.errorMessage = "Não foi possível encontrar uma rota a pé."
            }
        }
    }
}
