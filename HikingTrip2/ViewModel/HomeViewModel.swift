//
//  HomeViewModel.swift
//  HikingTrip2
//
//  Created by Lorran Silva on 10/10/25.
//

import Foundation
// observableobject é um protocolo usado para uma classe ser observada pela view
class HomeViewModel: ObservableObject {
    @Published var popularDestinations: [Destination] = []
    @Published var searchResults: [Destination] = []
    
    func fetchDestination(){
        
    }
    func searchDestination(keyword: String) {
        
    }
}
