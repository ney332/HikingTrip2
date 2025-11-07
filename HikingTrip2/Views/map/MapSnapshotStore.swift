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
  
}
