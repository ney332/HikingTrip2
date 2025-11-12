//import SwiftUI
import MapKit
import SwiftUI
import CoreLocation

struct MapView: View {
    @StateObject private var locationManager = LocationManager()
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -22.9, longitude: -43.2),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    var body: some View {
        ZStack {
            switch locationManager.authorizationStatus {
            case .notDetermined:
                // Ainda não pediu permissão
                VStack {
                    ProgressView("Solicitando permissão...")
                        .padding()
                }
                .onAppear {
                    locationManager.requestWhenInUse()
                }
                .ignoresSafeArea()
                
            case .restricted, .denied:
                // Permissão negada
                VStack(spacing: 16) {
                    Image(systemName: "location.slash.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.gray)
                    Text("Permissão de localização negada")
                        .font(.headline)
                    Text("Ative a localização em Ajustes para ver o mapa.")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                }
                .padding()
                .ignoresSafeArea()
                
            case .authorizedWhenInUse, .authorizedAlways:
                // Localização liberada ✅
                if let location = locationManager.currentLocation {
                    Map(
                        coordinateRegion: Binding(
                            get: {
                                MKCoordinateRegion(
                                    center: location.coordinate,
                                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                                )
                            },
                            set: { region = $0 }
                        ),
                        showsUserLocation: true,
                        userTrackingMode: .constant(.follow)
                    )
                    .ignoresSafeArea()
                } else {
                    // Mostra loading enquanto busca a primeira localização
                    ZStack {
                        Color(.systemGray5).ignoresSafeArea()
                        ProgressView("Obtendo localização atual...")
                    }
                }
                
            @unknown default:
                Text("Estado de autorização desconhecido")
            }
        }
        .onAppear {
            locationManager.requestWhenInUse()
        }
    }
}

#Preview {
    MapView()
}
