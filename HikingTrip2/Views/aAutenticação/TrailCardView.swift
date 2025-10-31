// TrailCardView.swift
import SwiftUI

struct TrailCardView: View {
    let trail: Trail

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Placeholder visual (poderia ser um mapa/snapshot no futuro)
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemGray5))
                    .frame(width: 200, height: 120)

                Image(systemName: "figure.hiking")
                    .font(.system(size: 36, weight: .semibold))
                    .foregroundStyle(.secondary)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(trail.name)
                    .font(.headline)
                    .lineLimit(2)

                Text(trail.location)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)

                HStack(spacing: 8) {
                    Label("\(formatDistance(trail.distanceKm))", systemImage: "map")
                        .font(.caption)
                    Label(trail.difficulty, systemImage: "flag")
                        .font(.caption)
                }
                .foregroundStyle(.secondary)
            }
            .frame(width: 200, alignment: .leading)
        }
        .padding(.vertical, 4)
    }

    private func formatDistance(_ km: Double) -> String {
        if km >= 10 {
            return String(format: "%.0f km", km)
        } else {
            return String(format: "%.1f km", km)
        }
    }
}

#Preview {
    TrailCardView(trail: Trail(
        id: "t1",
        name: "Trilha do Mirante",
        location: "Brasil",
        distanceKm: 7.2,
        difficulty: "Moderada",
        latitude: -22.9,
        longitude: -43.2
    ))
}
