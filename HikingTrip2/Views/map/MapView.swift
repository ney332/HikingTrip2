//
//  MapView.swift
//  HikingTrip2
//
//  Created by Lorran Silva on 08/10/25.
//

import SwiftUI
import MapKit
import CoreLocation
import UIKit

struct MapView: View {
    // Região padrão (você pode ajustar conforme sua necessidade)
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -22.9, longitude: -43.2),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )
    
    // Armazena o snapshot carregado/gerado
    @State private var snapshotImage: UIImage?
    // Define o tamanho desejado do snapshot. Como vamos usar full-screen seguro, pegamos a largura da tela.
    @State private var targetSize: CGSize = .zero
    // Controle simples para evitar gerar snapshot várias vezes
    @State private var isGenerating = false
    
    var body: some View {
        GeometryReader { geo in
            let size = CGSize(width: max(1, geo.size.width), height: max(1, geo.size.height))
            ZStack {
                if let image = snapshotImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                } else {
                    // Placeholder enquanto carrega/gera
                    ZStack {
                        Color(.systemGray5).ignoresSafeArea()
                        ProgressView("Carregando mapa...")
                            .padding()
                    }
                }
            }
            .onAppear {
                targetSize = size
                loadOrGenerateSnapshotIfNeeded(size: size)
            }
            .onChange(of: geo.size) { _, newSize in
                let newTarget = CGSize(width: max(1, newSize.width), height: max(1, newSize.height))
                // Atualiza apenas se mudou o suficiente (evita gerar por pequenas variações)
                let significantChange =
                    abs(newTarget.width - targetSize.width) > 20 ||
                    abs(newTarget.height - targetSize.height) > 20
                if significantChange {
                    targetSize = newTarget
                    loadOrGenerateSnapshotIfNeeded(size: newTarget, force: true)
                }
            }
        }
    }
    
    private func loadOrGenerateSnapshotIfNeeded(size: CGSize, force: Bool = false) {
        guard size.width > 0 && size.height > 0 else { return }
        
        // Se já temos um snapshot e não for forçado, não gere de novo
        if snapshotImage != nil && !force { return }
        
        // Se já está gerando, não duplica
        guard !isGenerating else { return }
        isGenerating = true
        
        // Configuração do snapshot
        let options = MKMapSnapshotter.Options()
        options.region = region
        options.size = size
        options.scale = UIScreen.main.scale
        
        // iOS 13+: use preferredConfiguration em vez de flags deprecadas
        let config = MKStandardMapConfiguration(elevationStyle: .realistic)
        config.pointOfInterestFilter = .includingAll
        // config.showsBuildings = true // Removed: not available on MKStandardMapConfiguration in this SDK
        options.preferredConfiguration = config
        
        options.traitCollection = UITraitCollection(userInterfaceStyle: .unspecified)
        
        let snapshotter = MKMapSnapshotter(options: options)
        snapshotter.start(with: .global(qos: .userInitiated)) { result, error in
            DispatchQueue.main.async {
                self.isGenerating = false
                if let image = result?.image {
                    self.snapshotImage = image
                } else {
                    // Em caso de erro, opcionalmente você pode fazer retry simples
                    // ou manter o placeholder. Aqui só loga.
                    #if DEBUG
                    print("MKMapSnapshotter error:", error?.localizedDescription ?? "unknown error")
                    #endif
                }
            }
        }
    }
}

#Preview {
    MapView()
}
