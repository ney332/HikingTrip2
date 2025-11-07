//
//  trail.swift
//  HikingTrip2
//
//  Created by User on 07/11/25.
//

import Foundation
import CoreLocation

struct Trail: Identifiable, Codable {
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

struct Coordinates: Codable {
    let lat: Double
    let lon: Double
}
