////
////  PlannerView.swift
////  HikingTrip2
////
////  Created by Lorran Silva on 08/10/25.
////
//
//import SwiftUI
//
//struct PlannerView: View {
//    @State private var viewModel = TrailListView()
//    @FocusState private var focusedField: Field?
//
//    enum Field {
//        case origin, destination, search
//    }
//
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                VStack(spacing: 16) {
//                   
//                    Spacer(minLength: 24)
//                }
//            }
//            .navigationTitle("Planejar trilhas")
//        }
//    }

//    // MARK: - Sections
//
//    @ViewBuilder
//    private var originDestinationSection: some View {
//        VStack(alignment: .leading, spacing: 12) {
//            Text("Planejar trajeto")
//                .font(.title2)
//                .bold()
//
//            VStack(spacing: 10) {
//                HStack(spacing: 8) {
//                    Image(systemName: "location.fill")
//                        .foregroundStyle(.secondary)
//                    TextField("Origem (cidade/país)", text: $viewModel.origin)
//                        .textInputAutocapitalization(.words)
//                        .disableAutocorrection(true)
//                        .focused($focusedField, equals: .origin)
//                }
//                .padding(12)
//                .background(Color(.systemGray6))
//                .clipShape(RoundedRectangle(cornerRadius: 12))
//
//                HStack(spacing: 8) {
//                    Image(systemName: "mappin.and.ellipse")
//                        .foregroundStyle(.secondary)
//                    TextField("Destino final (cidade/país)", text: $viewModel.destination)
//                        .textInputAutocapitalization(.words)
//                        .disableAutocorrection(true)
//                        .focused($focusedField, equals: .destination)
//                }
//                .padding(12)
//                .background(Color(.systemGray6))
//                .clipShape(RoundedRectangle(cornerRadius: 12))
//            }
//        }
//        .padding(.horizontal)
//    }
//
//  
// 
//
//    @ViewBuilder
//    private var generateButton: some View {
//        Button {
//            focusedField = nil
//            Task {
//                await viewModel.generateRouteBetweenOriginAndDestination()
//                // Não navega para mapa; apenas atualiza suggestedTrails e mensagens
//            }
//        } label: {
//            HStack {
//                if viewModel.isGeneratingRoute {
//                    ProgressView()
//                        .tint(.white)
//                }
//                Text(viewModel.isGeneratingRoute ? "Gerando roteiro..." : "Gerar roteiro")
//                    .bold()
//            }
//            .frame(maxWidth: .infinity)
//            .padding(.vertical, 12)
//            .background(viewModel.canGenerateRoute ? Color.accentColor : Color.gray)
//            .foregroundColor(.white)
//            .clipShape(RoundedRectangle(cornerRadius: 12))
//            .padding(.horizontal)
//        }
//        .disabled(!viewModel.canGenerateRoute || viewModel.isGeneratingRoute)
//    }
//
//    @ViewBuilder
//    private var routeErrorView: some View {
//        if let message = viewModel.routeErrorMessage, !message.isEmpty {
//            Text(message)
//                .font(.footnote)
//                .foregroundStyle(.red)
//                .padding(.horizontal)
//        }
//    }
//
//    @ViewBuilder
//    private var suggestedTrailsSection: some View {
//        if !viewModel.suggestedTrails.isEmpty {
//            VStack(alignment: .leading, spacing: 8) {
//                Text("Melhores trilhas sugeridas")
//                    .font(.headline)
//                    .padding(.horizontal)
//
//                ForEach(viewModel.suggestedTrails) { trail in
//                    VStack(alignment: .leading, spacing: 4) {
//                        Text(trail.name).bold()
//                        Text("\(trail.location) • \(String(format: "%.1f", trail.distanceKm)) km • \(trail.difficulty)")
//                            .font(.caption)
//                            .foregroundStyle(.secondary)
//                    }
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(12)
//                    .background(Color(.systemGray6))
//                    .clipShape(RoundedRectangle(cornerRadius: 12))
//                    .padding(.horizontal)
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    PlannerView()

