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
            TrailListView()
                .tabItem{ Label(
                    title: { Text("Trilhas") },
                    icon: { Image(systemName: "backpack") }
                )}
            ExperienciasView()
                .tabItem{ Label(
                    title: { Text("Experiências") },
                    icon: { Image(systemName: "tent.2") }
                )}
           PerfilView()
                .tabItem{ Label(
                    title: { Text("profile") },
                    icon: { Image(systemName: "person.fill") }
                )}
        }
    }
}

#Preview {
    Navegation()
}
