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
    @State private var searchText: String = ""
    private let service = APITrailService()

    // Location
    @StateObject private var locationManager = LocationManager()
    @State private var showLocationAlert: Bool = false
    @State private var locationAlertMessage: String = ""
    @State private var showSettingsButton: Bool = false

    // Computed property para filtrar
    private var filteredTrails: [Trail] {
        if searchText.isEmpty {
            return trails
        } else {
            return trails.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.country.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                // 🔍 Search bar
                SearchBarView(searchText: $searchText)

                if filteredTrails.isEmpty {
                    VStack(spacing: 10) {
                        Image(systemName: "magnifyingglass")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                        Text("Nenhum destino encontrado")
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 80)
                } else {
                    List(filteredTrails) { trail in
                        NavigationLink(destination: TrailDetailView(trail: trail)) {
                            TrailCardView(trail: trail)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Destinos")
            .onAppear {
                handleLocationAuthorizationOnAppear()
                service.fetchTrails { self.trails = $0 }
            }
            .onReceive(locationManager.$authorizationStatus) { status in
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
            locationAlertMessage = "Precisamos da sua localização para sugerir rotas e calcular trajetos até as trilhas próximas."
            showSettingsButton = false
            showLocationAlert = true
            locationManager.requestWhenInUse()
        case .denied, .restricted:
            locationAlertMessage = "Permissão de localização negada. Para aproveitar os recursos de rota, habilite a localização nos Ajustes."
            showSettingsButton = true
            showLocationAlert = true
        case .authorizedAlways, .authorizedWhenInUse, .authorized:
            break
        @unknown default:
            break
        }
    }

    private func updateAlertFor(status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationAlertMessage = "Precisamos da sua localização para sugerir rotas e calcular trajetos até as trilhas próximas."
            showSettingsButton = false
        case .denied, .restricted:
            locationAlertMessage = "Permissão de localização negada. Para aproveitar os recursos de rota, habilite a localização nos Ajustes."
            showSettingsButton = true
            showLocationAlert = true
        case .authorizedAlways, .authorizedWhenInUse, .authorized:
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

// MARK: - SearchBarView
struct SearchBarView: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Buscar destino...", text: $searchText)
                .textInputAutocapitalization(.never)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding(.horizontal)
    }
}

#Preview {
    TrailListView()
}
