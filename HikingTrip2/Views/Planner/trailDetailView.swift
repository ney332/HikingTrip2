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
    
    @State private var showInMaps = false


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

                // solucao do problema de gerar rota, abre direto no mapa segundo a location da trilha 
                Button(action: openInMaps) {
                    HStack {
                        Image(systemName: "map")
                        Text("Ver rota no mapa")
                            .bold()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(radius: 4)
                }
                .padding(.top, 12)
                
                // gera automaticamente uma rota dentro do mapa integrado, mas somente lugares proximos a localizacao do usuario, se a trilha for em outro pais, retorna erro
                
//                Button {
//                    errorMessage = nil
//                    buildRouteToTrail()
//                } label: {
//                    HStack {
//                        Image(systemName: "point.topleft.down.curvedto.point.bottomright.up")
//                        Text("Traçar rota até aqui")
//                            .bold()
//                    }
//                    .frame(maxWidth: .infinity)
//                    .padding(.vertical, 12)
//                }
//                .buttonStyle(.borderedProminent)
//                .padding(.top, 8)
//
//                if let errorMessage {
//                    Text(errorMessage)
//                        .font(.footnote)
//                        .foregroundStyle(.red)
//                }
//
//                // Navegação programática para o MapRouteView quando a rota estiver pronta
//                if let route = builtRoute, let origin = originCoord {
//                    NavigationLink(
//                        destination: MapRouteView(
//                            route: route,
//                            origin: origin,
//                            destination: CLLocationCoordinate2D(latitude: trail.coordinates.lat, longitude: trail.coordinates.lon),
//                            trails: [trail]
//                        ),
//                        isActive: $isPushingRoute
//                    ) {
//                        EmptyView()
//                    }
//                    .hidden()
//                }
              
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
    private func openInMaps() {
        let coordinate = CLLocationCoordinate2D(
            latitude: trail.coordinates.lat,
            longitude: trail.coordinates.lon
        )
        
        let placemark = MKPlacemark(coordinate: coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = trail.name
        
        // Abre diretamente no Apple Maps com rota
        mapItem.openInMaps(launchOptions: [
            MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
        ])
    }


    // MARK: - Rota
    private func buildRouteToTrail(retryCount: Int = 0) {
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

        // Verifica se já temos a localização atual
        guard let userLocation = locationManager.currentLocation else {
            if retryCount < 3 {
                errorMessage = "Obtendo sua localização atual..."
                // Tenta novamente após 1 segundo (máx. 3 tentativas)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    buildRouteToTrail(retryCount: retryCount + 1)
                }
            } else {
                errorMessage = "Não foi possível obter sua localização. Tente novamente em alguns segundos."
            }
            locationManager.startUpdating()
            return
        }

        // Coordenadas de origem e destino
        let origin = userLocation.coordinate
        let destination = CLLocationCoordinate2D(
            latitude: trail.coordinates.lat,
            longitude: trail.coordinates.lon
        )

        // Configura o pedido de rota
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: origin))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
        request.transportType = .walking

        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            DispatchQueue.main.async {
                if let route = response?.routes.first {
                    self.builtRoute = route
                    self.originCoord = origin
                    self.isPushingRoute = true
                } else if let error = error {
                    print("Erro MKDirections:", error.localizedDescription)
                    self.errorMessage = "Falha ao calcular rota: \(error.localizedDescription)"
                } else {
                    self.errorMessage = "Não foi possível encontrar uma rota a pé."
                }
            }
        }
    }

    }

