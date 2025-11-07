//
//  MapViewModel.swift
//  HikingTrip2
//
//  Created by Lorran Silva on 10/10/25.
//

import Foundation
import MapKit

class MapViewModel: ObservableObject {
    @Published var region = MKCoordinateRegion()
    @Published var pins: [MKPointAnnotation] = []
    
    
}
