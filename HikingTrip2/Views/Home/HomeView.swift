//
//  HomeView.swift
//  HikingTrip2
//
//  Created by Lorran Silva on 08/10/25.
//
import SwiftUI

struct HomeView: View {
    
    @State private var allTrails: [Trail] = []
    private let service = APITrailService()
    
    // MARK: - Computed sections
    private var maisVisitadas: [Trail] {
        Array(allTrails.sorted { $0.rating > $1.rating }.prefix(6))
    }
    private var africa: [Trail] {
        allTrails.filter { continent(for: $0.country) == .africa }
    }
    private var europa: [Trail] {
        allTrails.filter { continent(for: $0.country) == .europa }
    }
    private var americaDoSul: [Trail] {
        allTrails.filter { continent(for: $0.country) == .americaDoSul }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 28) {
                    
                    // 🌄 HERO HEADER
                    ZStack(alignment: .bottomLeading) {
                        Image("heroMountains")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 220)
                            .clipped()
                            .overlay(
                                LinearGradient(
                                    gradient: Gradient(colors: [.black.opacity(0.0), .black.opacity(0.45)]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .cornerRadius(32)
                            .shadow(radius: 4)
                            .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text("HikingTrip")
                                .font(.system(size: 38, weight: .bold, design: .rounded))
                                .foregroundStyle(LinearGradient(colors: [.white, .mint.opacity(0.9)], startPoint: .leading, endPoint: .trailing))
                            
                            Text("Descubra trilhas incríveis pelo mundo 🌍")
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.9))
                        }
                        .padding(.leading, 36)
                        .padding(.bottom, 26)
                    }
                    .padding(.top, 8)
                    
                    // Seções
                    if !maisVisitadas.isEmpty {
                        section(title: "Mais visitadas", items: maisVisitadas)
                    }
                    if !africa.isEmpty {
                        section(title: "África", items: africa)
                    }
                    if !europa.isEmpty {
                        section(title: "Europa", items: europa)
                    }
                    if !americaDoSul.isEmpty {
                        section(title: "América do Sul", items: americaDoSul)
                    }
                    
                    Spacer(minLength: 40)
                }
                .padding(.top, 4)
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .onAppear {
                service.fetchTrails { trails in
                    self.allTrails = trails
                }
            }
            .background(Color(.systemGroupedBackground))
        }
    }
    
    // MARK: - Section Builder
    @ViewBuilder
    private func section(title: String, items: [Trail]) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(spacing: 8) {
                Image(systemName: "globe.europe.africa.fill")
                    .font(.title3)
                    .foregroundColor(.mint)
                Text(title)
                    .font(.title2.bold())
                    .foregroundColor(.primary)
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {          HStack(spacing: 8) {
                ForEach(items) { trail in NavigationLink(destination: TrailDetailView(trail: trail)) { DestinationCardView(trail: trail)
                } .buttonStyle(PlainButtonStyle())
                    // mantém aparência
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.bottom, 8)
        // Faz com que o NavigationStack saiba para onde navega
    }
    
    // MARK: - Continente helper
    private enum Continente {
        case africa, europa, americaDoSul, outro
    }
    
    private func continent(for country: String) -> Continente {
        let c = country.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
        let africaSet: Set<String> = ["africa do sul", "marrocos", "quenia", "egito", "namibia", "tanzania", "kenya", "morocco", "south africa"]
        let europaSet: Set<String> = ["franca", "italia", "espanha", "reino unido", "portugal", "holanda", "alemanha", "france", "italy", "spain", "united kingdom", "netherlands", "germany"]
        let amerSulSet: Set<String> = ["brasil", "argentina", "peru", "chile", "colombia", "uruguai", "paraguai", "bolivia", "equador"]
        let key = c.trimmingCharacters(in: .whitespacesAndNewlines)
        if africaSet.contains(key) { return .africa }
        if europaSet.contains(key) { return .europa }
        if amerSulSet.contains(key) { return .americaDoSul }
        if key.contains("south africa") || key.contains("kenya") || key.contains("morocco") { return .africa }
        if key.contains("france") || key.contains("italy") || key.contains("spain") || key.contains("united kingdom") || key.contains("netherlands") || key.contains("germany") { return .europa }
        if key.contains("brazil") || key.contains("argentina") || key.contains("peru") || key.contains("chile") || key.contains("colombia") { return .americaDoSul }
        return .outro
    }
}

#Preview {
    HomeView()
}
