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
        // Top 6 por rating
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
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {

                    // Barra de busca (mantida)
                    SearchBarView()

                    // Seções de trilhas por continente
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

                    Spacer(minLength: 12)
                }
                .padding(.top, 8)
            }
            .navigationTitle("HikingTrip")
            .onAppear {
                // Carregar da API
                service.fetchTrails { trails in
                    self.allTrails = trails
                }
            }
        }
    }

    // MARK: - Views
    @ViewBuilder
    private func section(title: String, items: [Trail]) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title2)
                .bold()
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(items) { trail in
                        NavigationLink(destination: TrailDetailView(trail: trail)) {
                            DestinationCardView(trail: trail)
                        }
                        .buttonStyle(PlainButtonStyle()) // preserva a aparência do card
                    }
                }
                .padding(.horizontal)
            }
        }
    }

    // MARK: - Continente helper
    private enum Continente {
        case africa, europa, americaDoSul, outro
    }

    private func continent(for country: String) -> Continente {
        let c = country.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)

        // África
        let africaSet: Set<String> = [
            "africa do sul", "marrocos", "quenia", "egito", "namibia", "tanzania", "quenia", "kenya", "morocco", "south africa"
        ]

        // Europa
        let europaSet: Set<String> = [
            "franca", "italia", "espanha", "reino unido", "portugal", "holanda", "alemanha", "france", "italy", "spain", "united kingdom", "portugal", "netherlands", "germany"
        ]

        // América do Sul
        let amerSulSet: Set<String> = [
            "brasil", "argentina", "peru", "chile", "colombia", "uruguai", "paraguai", "bolivia", "equador"
        ]

        let key = c.trimmingCharacters(in: .whitespacesAndNewlines)

        if africaSet.contains(key) { return .africa }
        if europaSet.contains(key) { return .europa }
        if amerSulSet.contains(key) { return .americaDoSul }

        // Heurísticas simples por língua/variações
        if key.contains("south africa") || key.contains("kenya") || key.contains("morocco") { return .africa }
        if key.contains("france") || key.contains("italy") || key.contains("spain") || key.contains("united kingdom") || key.contains("netherlands") || key.contains("germany") { return .europa }
        if key.contains("brazil") || key.contains("argentina") || key.contains("peru") || key.contains("chile") || key.contains("colombia") { return .americaDoSul }

        return .outro
    }
}

#Preview {
    HomeView()
}

