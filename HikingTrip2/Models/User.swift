//
//  User.swift
//  HikingTrip2
//
//  Created by Lorran Silva on 10/10/25.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    var name: String
    var email: String
    var photoURL: String?
    var savedItineraries: [Itinerary]
}
