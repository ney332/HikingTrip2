//
//  DestinationCardView.swift
//  HikingTrip2
//
//  Created by Lorran Silva on 08/10/25.
//struct CardView: View {
//    let trail: Trail
//
//    var body: some View {
//        HStack(alignment: .top) {
//            AsyncImage(url: URL(string: trail.image)) { image in
//                image
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 100, height: 80)
//                    .cornerRadius(10)
//            } placeholder: {
//                ProgressView()
//            }
//
//            VStack(alignment: .leading, spacing: 6) {
//                Text(trail.name)
//                    .font(.headline)
//                Text("\(trail.country) • \(trail.difficulty)")
//                    .font(.subheadline)
//                    .foregroundColor(.secondary)
//                HStack {
//                    Image(systemName: "star.fill")
//                        .foregroundColor(.yellow)
//                        .font(.caption)
//                    Text(String(format: "%.1f", trail.rating))
//                        .font(.caption)
//                        .foregroundColor(.gray)
//                }
//            }
//        }
//        .padding(.vertical, 5)
//    
