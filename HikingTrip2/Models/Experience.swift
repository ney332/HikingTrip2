//
//  Experience.swift
//  HikingTrip2
//
//  Created by Lorran Silva on 07/11/25.
//

import Foundation

struct Experience: Identifiable {
    let id = UUID()
    let title: String
    let category: ExperienceCategory
    let image: String
    let description: String
    let location: String 
    let address: String
    let tag: String
   
}

enum ExperienceCategory: String, CaseIterable {
    case aventura = "Aventura"
    case bares = "Bares"
    case restaurantes = "Restaurantes"
    case natureza = "Conexão com a Natureza"
    case cultura = "Cultura"
}
