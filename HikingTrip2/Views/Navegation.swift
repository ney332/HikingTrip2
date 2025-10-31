//
//  Navegation.swift
//  HikingTrip2
//
//  Created by Lorran Silva on 08/10/25.
//

import SwiftUI

struct Navegation: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem{ Label(
                    title: { Text("home") },
                    icon: { Image(systemName: "house.fill") }
                )}
            PlannerView()
                .tabItem{ Label(
                    title: { Text("Planejar") },
                    icon: { Image(systemName: "backpack") }
                )}
            MapView()
                .tabItem{ Label(
                    title: { Text("Map") },
                    icon: { Image(systemName: "map") }
                )}
            PerfilView()
                
        }
    }
}

#Preview {
    Navegation()
}
