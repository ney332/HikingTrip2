//
//  Trail.swift
//  HikingTrip2
//
//  Created by Lorran Silva on 10/10/25.
//

import Foundation

struct Trail: Identifiable, Codable, Equatable {
    let id: String
    let name: String
    let location: String
    let distanceKm: Double
    let difficulty: String
}
