//
//  ExperienciasView.swift
//  HikingTrip2
//
//  Created by Lorran Silva on 07/11/25.
//
import SwiftUI

struct ExperienciasView: View {
    private let groupedExperiences = Dictionary(
        grouping: MockData.allExperiences,
        by: { $0.category }
    )

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 28) {

                    // 🌄 HERO HEADER — mesmo estilo do HomeView
                    ZStack(alignment: .bottomLeading) {
                        Image("heroMountains")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 120)
                            .clipped()
                            .overlay(
                                LinearGradient(
                                    gradient: Gradient(colors: [.black.opacity(0.9), .blue.opacity(0.5)]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .cornerRadius(32)
                            .shadow(radius: 4)
                            .padding(.horizontal)

                        VStack(alignment: .leading, spacing: 6) {
                            Text("Experiências")
                                .font(.system(size: 38, weight: .bold, design: .rounded))
                                .foregroundStyle(LinearGradient(colors: [.green, .mint.opacity(0.9)], startPoint: .leading, endPoint: .trailing))

                            Text("Descubra novas aventuras e sabores 🌎")
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.9))
                        }
                        .padding(.leading, 36)
                        .padding(.bottom, 26)
                    }
                    .padding(.top, 8)

                    // 🔹 Seção de destinos
                    VStack(alignment: .leading, spacing: 14) {
                        HStack(spacing: 8) {
                            Image(systemName: "globe.americas.fill")
                                .font(.title3)
                                .foregroundColor(.mint)
                            Text("Destinos na América do Sul")
                                .font(.title2.bold())
                        }
                        .padding(.horizontal)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(MockData.destinos) { destino in
                                    NavigationLink(destination: DestinationExperiencesView(destino: destino)) {
                                        VStack {
                                            Text(destino.nome)
                                                .font(.subheadline.bold())
                                                .foregroundColor(.primary)
                                                .padding(.horizontal, 8)
                                                .padding(.vertical, 6)
                                                .background(Color(.systemGray6))
                                                .cornerRadius(12)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 12)
                                                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                                )
                                                .shadow(color: .black.opacity(0.08), radius: 3, x: 0, y: 1)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }

                    // 🔹 Seções de experiências
                    ForEach(ExperienceCategory.allCases, id: \.self) { category in
                        if let items = groupedExperiences[category] {
                            StyledSectionView(title: category.rawValue, items: items)
                        }
                    }

                    Spacer(minLength: 40)
                }
                .padding(.top, 4)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

// MARK: - Seção estilizada
struct StyledSectionView: View {
    let title: String
    let items: [Experience]
    var isFullWidth: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(spacing: 8) {
                Image(systemName: "figure.hiking")
                    .font(.title3)
                    .foregroundColor(.mint)
                Text(title)
                    .font(.title2.bold())
                    .foregroundColor(.primary)
            }
            .padding(.horizontal)

            if isFullWidth {
                VStack(spacing: 25) {
                    ForEach(items) { item in
                        NavigationLink(destination: ExperienceDetailView(experience: item)) {
                            ExperienceCardView(experience: item, isFullWidth: true)
                        }
                    }
                }
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(items) { item in
                            NavigationLink(destination: ExperienceDetailView(experience: item)) {
                                ExperienceCardView(experience: item)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                }
            }
        }
        .padding(.bottom, 9)
    }
}

// MARK: - Card de experiência
struct ExperienceCardView: View {
    let experience: Experience
    var isFullWidth: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .bottomLeading) {
                Image(experience.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: isFullWidth ? 350 : 220,
                           height: isFullWidth ? 180 : 130)
                    .clipped()
                    .cornerRadius(14)
                    .overlay(
                        LinearGradient(
                            colors: [.clear, .black.opacity(0.35)],
                            startPoint: .center,
                            endPoint: .bottom
                        )
                        .cornerRadius(14)
                    )

                HStack(spacing: 5) {
                    Image(systemName: "mappin.and.ellipse")
                        .font(.caption)
                    Text(experience.location)
                        .font(.caption)
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                .padding(6)
                .background(.ultraThinMaterial)
                .cornerRadius(8)
                .padding(8)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(experience.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.9)
                
                    Text(experience.category.rawValue)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                    
                    Text(experience.tag)
                    font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
                
            }
            .frame(width: isFullWidth ? 350 : 220, alignment: .leading)
            .padding(.horizontal, 4)
            .padding(.bottom, 8)
        }
        .frame(width: isFullWidth ? 350 : 220)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 4)
    }
}

// MARK: - Experiências por destino
struct DestinationExperiencesView: View {
    let destino: Destino

    var filteredExperiences: [Experience] {
        MockData.allExperiences.filter { $0.location.contains(destino.nome) }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Favoritos em \(destino.nome)")
                    .font(.title2.bold())
                    .padding(.top)

                if filteredExperiences.isEmpty {
                    Text("Nenhuma experiência disponível aqui ainda 😅")
                        .foregroundColor(.secondary)
                        .padding()
                } else {
                    ForEach(filteredExperiences) { exp in
                        StyledSectionView(
                            title: exp.category.rawValue,
                            items: [exp],
                            isFullWidth: true
                        )
                    }
                }
            }
            .padding(.horizontal)
            .navigationTitle(destino.nome)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ExperienciasView()
}
