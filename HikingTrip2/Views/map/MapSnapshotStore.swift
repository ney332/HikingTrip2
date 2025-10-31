//
//  MapSnapshotStore.swift
//  HikingTrip2
//
//  Created by Assistant on 10/10/25.
//

import Foundation
import MapKit
import UIKit

final class MapSnapshotStore {
    static let shared = MapSnapshotStore()
    
    private let fileManager = FileManager.default
    private let cacheDirectory: URL
    
    private init() {
        if let url = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first {
            cacheDirectory = url.appendingPathComponent("MapSnapshots", isDirectory: true)
        } else {
            cacheDirectory = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("MapSnapshots", isDirectory: true)
        }
        try? fileManager.createDirectory(at: cacheDirectory, withIntermediateDirectories: true)
    }
    
    // Gera uma chave de arquivo baseada na região e no estilo
    private func filename(for region: MKCoordinateRegion, size: CGSize, scale: CGFloat, appearance: UIUserInterfaceStyle) -> String {
        let c = region.center
        let s = region.span
        let key = String(format: "lat%.5f_lon%.5f_dlat%.5f_dlon%.5f_w%.0f_h%.0f_scale%.1f_ui%d",
                         c.latitude, c.longitude, s.latitudeDelta, s.longitudeDelta,
                         size.width, size.height, scale, appearance.rawValue)
        let safe = key.replacingOccurrences(of: " ", with: "_")
        return safe + ".png"
    }
    
    private func fileURL(for region: MKCoordinateRegion, size: CGSize, scale: CGFloat, appearance: UIUserInterfaceStyle) -> URL {
        cacheDirectory.appendingPathComponent(filename(for: region, size: size, scale: scale, appearance: appearance))
    }
    
    func cachedImage(for region: MKCoordinateRegion, size: CGSize, scale: CGFloat = UIScreen.main.scale, appearance: UIUserInterfaceStyle = .unspecified) -> UIImage? {
        let url = fileURL(for: region, size: size, scale: scale, appearance: appearance)
        guard fileManager.fileExists(atPath: url.path) else { return nil }
        return UIImage(contentsOfFile: url.path)
    }
    
    func saveImage(_ image: UIImage, for region: MKCoordinateRegion, size: CGSize, scale: CGFloat = UIScreen.main.scale, appearance: UIUserInterfaceStyle = .unspecified) {
        let url = fileURL(for: region, size: size, scale: scale, appearance: appearance)
        guard let data = image.pngData() else { return }
        try? data.write(to: url, options: .atomic)
    }
    
    // Gera snapshot assíncrono
    func makeSnapshot(for region: MKCoordinateRegion, size: CGSize, scale: CGFloat = UIScreen.main.scale, appearance: UIUserInterfaceStyle = .unspecified) async throws -> UIImage {
        let options = MKMapSnapshotter.Options()
        options.region = region
        options.size = size
        options.scale = scale
        // Você pode ajustar o estilo (standard/satellite/hybrid)
        options.mapType = .standard
        options.showsBuildings = true
        options.showsPointsOfInterest = true
        
        // Aparência clara/escura conforme pedido
        if appearance != .unspecified {
            let traits = UITraitCollection(userInterfaceStyle: appearance)
            options.traitCollection = traits
        }
        
        let snapshotter = MKMapSnapshotter(options: options)
        let snapshot = try await snapshotter.start()
        return snapshot.image
    }
}
