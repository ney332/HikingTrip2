//
//  Destination.swift
//  HikingTrip2
//
//  Created by Lorran Silva on 10/10/25.
//

import Foundation

struct Destination: Identifiable, Codable {
    let id: Int
    let name: String
    let country: String
    let location: String
    let difficulty: String
    let length_km: Double
    let duration: String
    let rating: Double
    let coordinates: Coordinates
    let tags: [String]
    let image: String
    let description: String
}
