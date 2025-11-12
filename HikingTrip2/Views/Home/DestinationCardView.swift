
import SwiftUI

struct DestinationCardView: View {
    let trail: Trail
    @State private var isImageLoaded = false
    @State private var isPressed = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            // MARK: - Imagem com overlay e clima
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: URL(string: trail.image)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 220, height: 130)
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
                        .opacity(isImageLoaded ? 1 : 0)
                        .onAppear {
                            withAnimation(.easeIn(duration: 0.4)) {
                                isImageLoaded = true
                            }
                        }
                } placeholder: {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 220, height: 130)
                        .shimmer()
                }
                
                // 🔆 Temperatura e clima (placeholder)
                HStack(spacing: 4) {
                    Image(systemName: "sun.max.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.yellow, .orange)
                        .font(.caption)
                    Text("22°C")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .padding(6)
                .background(.ultraThinMaterial)
                .cornerRadius(8)
                .padding(8)
            }
            
            // MARK: - Informações
            VStack(alignment: .leading, spacing: 4) {
                Text(trail.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.9)
                
                Text(trail.location)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
                
                HStack(spacing: 10) {
                    Label("\(formatDistance(trail.length_km))", systemImage: "map.fill")
                        .font(.caption)
                        .symbolRenderingMode(.hierarchical)
                        .foregroundColor(.secondary)
                    
                    Label(trail.difficulty, systemImage: difficultyIcon(for: trail.difficulty))
                        .font(.caption)
                        .foregroundColor(colorForDifficulty(trail.difficulty))
                }
            }
            .frame(width: 220, alignment: .leading)
            .padding(.horizontal, 4)
            .padding(.bottom, 8)
        }
        .frame(width: 220)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.08), radius: 4, x: 0, y: 2)
//        .scaleEffect(isPressed ? 0.96 : 1)
//        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isPressed)
//        .onLongPressGesture(minimumDuration: 0.01) {
//            withAnimation {
//                isPressed = true
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
//                    isPressed = false
//                }
            }
        }
//    }
    
    // MARK: - Helpers
    private func formatDistance(_ km: Double) -> String {
        km >= 10 ? String(format: "%.0f km", km) : String(format: "%.1f km", km)
    }
    
    private func colorForDifficulty(_ difficulty: String) -> Color {
        switch difficulty.lowercased() {
        case "fácil", "easy": return .green
        case "moderada", "moderate": return .orange
        case "difícil", "hard": return .red
        case "extrema": return .purple
        default: return .gray
        }
    }
    
    private func difficultyIcon(for difficulty: String) -> String {
        switch difficulty.lowercased() {
        case "fácil", "easy": return "leaf.fill"
        case "moderada", "moderate": return "figure.walk"
        case "difícil", "hard": return "mountain.2.fill"
        case "extrema": return "flame.fill"
        default: return "flag"
        }
    }
//}

// MARK: - Efeito shimmer
extension View {
    func shimmer() -> some View {
        self
            .overlay(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.white.opacity(0.4),
                        Color.white.opacity(0.15),
                        Color.white.opacity(0.4)
                    ]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .rotationEffect(.degrees(25))
                .offset(x: -250)
                .animation(
                    Animation.linear(duration: 1.2)
                        .repeatForever(autoreverses: false),
                    value: UUID()
                )
            )
            .mask(self)
    }
}
