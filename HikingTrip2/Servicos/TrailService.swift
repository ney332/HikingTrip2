//  TrailService.swift
//  HikingTrip2
//
//  Created by Lorran Silva on 10/10/25.
//

import Foundation
import CoreLocation

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

        // Simula latência de rede (~0.6s)
        try await Task.sleep(nanoseconds: 600_000_000)

        // Mock simples baseado no texto, preenchendo todos os campos exigidos por Trail
        let baseDistances: [Double] = [12.4, 6.8, 18.2, 9.1, 4.7]
        let names = [
            "Trilha Pico do Horizonte",
            "Cachoeira das Pedras",
            "Serra do Vento",
            "Vale Encantado",
            "Mirante do Sol"
        ]
        let difficulties = ["Moderada", "Fácil", "Difícil", "Moderada", "Fácil"]

        func pseudoCoordOffset(for index: Int) -> (lat: Double, lon: Double) {
            let baseLat = -22.90
            let baseLon = -43.20
            let latOffset = Double((index * 7) % 10) * 0.01
            let lonOffset = Double((index * 11) % 10) * 0.01
            return (baseLat + latOffset, baseLon + lonOffset)
        }

        var trails: [Trail] = []
        for i in 0..<names.count {
            let offsets = pseudoCoordOffset(for: i)
            let trail = Trail(
                id: i + 1, // Int exigido pelo modelo
                name: names[i],
                country: "Brasil", // mock
                location: query, // usa o texto buscado como local
                difficulty: difficulties[i],
                length_km: baseDistances[i],
                duration: "3h \(30 + i * 10)m", // mock
                rating: 3.5 + Double(i) * 0.3, // mock
                coordinates: Coordinates(lat: offsets.lat, lon: offsets.lon),
                tags: ["natureza", "vista", "fotografia"].shuffled(),
                image: "https://picsum.photos/seed/\(i+1)/600/300",
                description: "Uma bela trilha chamada \(names[i]) próxima de \(query), ideal para quem busca \(difficulties[i].lowercased())."
            )
            trails.append(trail)
        }
        return trails
    }
}

