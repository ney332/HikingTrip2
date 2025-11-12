//
//  ExperienceDetailView.swift
//  HikingTrip2
//
//  Created by Lorran Silva on 08/11/25.
//

import SwiftUI
import MapKit

struct ExperienceDetailView: View {
    let experience: Experience
    
    @State private var showInMaps = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Imagem principal
                Image(experience.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 240)
                    .clipped()
                    .cornerRadius(12)
                
                // Título
                Text(experience.title)
                    .font(.title2.bold())
                    .padding(.bottom, 4)
                
                // Localização + tag
                HStack(spacing: 8) {
                    Label(experience.location, systemImage: "mappin.and.ellipse")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Divider()
                        .frame(height: 14)
                    
                    Label(experience.tag, systemImage: "tag")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                // Descrição
                Text(experience.description)
                    .font(.body)
                    .foregroundColor(.primary)
                    .padding(.top, 8)
                
                Spacer(minLength: 30)
                
                // Botão para abrir no Mapas
                Button(action: openInMaps) {
                    HStack {
                        Image(systemName: "map")
                        Text("Ver rota no mapa")
                            .bold()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(radius: 4)
                }
                .padding(.top, 12)
            }
            .padding()
        }
        .navigationTitle(experience.title)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // Função pra abrir o Mapas nativo
    private func openInMaps() {
        let query = experience.address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        if let url = URL(string: "http://maps.apple.com/?q=\(query)") {
            UIApplication.shared.open(url)
        }
    }
}

