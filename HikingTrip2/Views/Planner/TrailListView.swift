//
//  TrailListView.swift
//  HikingTrip2
//
//  Created by User on 07/11/25.
//

import SwiftUI
import CoreLocation

struct TrailListView: View {
    @State private var trails: [Trail] = []
    private let service = APITrailService()

    // Location
    @StateObject private var locationManager = LocationManager()
    @State private var showLocationAlert: Bool = false
    @State private var locationAlertMessage: String = ""
    @State private var showSettingsButton: Bool = false

    var body: some View {
        NavigationView {
            List(trails) { trail in
                NavigationLink(destination: TrailDetailView(trail: trail)) {
                    TrailCardView(trail: trail)
                }
            }
            .navigationTitle("Destinos")
            .onAppear {
                handleLocationAuthorizationOnAppear()
                // Carrega trilhas da API
                service.fetchTrails { self.trails = $0 }
            }
            .onReceive(locationManager.$authorizationStatus) { status in
                // Atualiza alerta quando o status mudar
                updateAlertFor(status: status)
            }
            .alert("Permissão de Localização", isPresented: $showLocationAlert) {
                if showSettingsButton {
                    Button("Abrir Ajustes") {
                        openAppSettings()
                    }
                }
                Button("OK", role: .cancel) { }
            } message: {
                Text(locationAlertMessage)
            }
        }
    }

    private func handleLocationAuthorizationOnAppear() {
        let status = locationManager.authorizationStatus
        switch status {
        case .notDetermined:
            // Mostra um alerta explicando antes do prompt do sistema
            locationAlertMessage = "Precisamos da sua localização para sugerir rotas e calcular trajetos até as trilhas próximas."
            showSettingsButton = false
            showLocationAlert = true
            // Em seguida, dispara a solicitação do sistema
            locationManager.requestWhenInUse()
        case .denied, .restricted:
            locationAlertMessage = "Permissão de localização negada. Para aproveitar os recursos de rota, habilite a localização nos Ajustes."
            showSettingsButton = true
            showLocationAlert = true
        case .authorizedAlways, .authorizedWhenInUse, .authorized:
            // Autorizado — nada a fazer
            break
        @unknown default:
            break
        }
    }

    private func updateAlertFor(status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            // Se ainda não determinado, podemos manter a mensagem informativa
            locationAlertMessage = "Precisamos da sua localização para sugerir rotas e calcular trajetos até as trilhas próximas."
            showSettingsButton = false
        case .denied, .restricted:
            locationAlertMessage = "Permissão de localização negada. Para aproveitar os recursos de rota, habilite a localização nos Ajustes."
            showSettingsButton = true
            showLocationAlert = true
        case .authorizedAlways, .authorizedWhenInUse, .authorized:
            // Oculta alerta quando autorizado
            showLocationAlert = false
        @unknown default:
            break
        }
    }

    private func openAppSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

struct TrailCardView: View {
    let trail: Trail

    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: trail.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 80)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
            }

            VStack(alignment: .leading, spacing: 6) {
                Text(trail.name)
                    .font(.headline)
                Text("\(trail.country) • \(trail.difficulty)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.caption)
                    Text(String(format: "%.1f", trail.rating))
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.vertical, 5)
    }
}

#Preview{
    TrailListView()
}
