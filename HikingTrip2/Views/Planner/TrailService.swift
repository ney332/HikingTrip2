//
//  TrailService.swift
//  HikingTrip2
//
//  Created by Lorran Silva on 10/10/25.
//

import Foundation

protocol TrailServicing {
    func fetchTopTrails(for location: String) async throws -> [Trail]
}

enum TrailServiceError: Error {
    case emptyQuery
}

final class TrailService: TrailServicing {
    func fetchTopTrails(for location: String) async throws -> [Trail] {
        let query = location.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !query.isEmpty else { throw TrailServiceError.emptyQuery }
        
        // Simula latência de rede
        try await Task.sleep(nanoseconds: 600_000_000)
        
        // Mock simples baseado no texto
        let base = [
            Trail(id: UUID().uuidString, name: "Trilha Pico do Horizonte", location: query, distanceKm: 12.4, difficulty: "Moderada"),
            Trail(id: UUID().uuidString, name: "Cachoeira das Pedras", location: query, distanceKm: 6.8, difficulty: "Fácil"),
            Trail(id: UUID().uuidString, name: "Serra do Vento", location: query, distanceKm: 18.2, difficulty: "Difícil"),
            Trail(id: UUID().uuidString, name: "Vale Encantado", location: query, distanceKm: 9.1, difficulty: "Moderada"),
            Trail(id: UUID().uuidString, name: "Mirante do Sol", location: query, distanceKm: 4.7, difficulty: "Fácil")
        ]
        return base
    }
}
