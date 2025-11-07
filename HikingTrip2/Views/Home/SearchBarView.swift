//
//  SearchBarView.swift
//  HikingTrip2
//
//  Created by Lorran Silva on 08/10/25.
//

import SwiftUI

struct SearchBarView: View {
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Buscar destino...", text: .constant(""))
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding(.horizontal)
    }
}

#Preview {
    SearchBarView()
}
