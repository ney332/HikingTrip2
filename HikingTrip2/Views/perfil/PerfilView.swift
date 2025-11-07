//
//  Perfil.view.swift
//  HikingTrip2
//
//  Created by Lorran Silva on 08/10/25.
//

import SwiftUI

struct PerfilView: View {
    var body: some View {
        VStack{
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width:100, height: 100)
                .padding()
            
            Text("üsername")
                .font(.title)
            
            Button("sair"){
                
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

#Preview {
    PerfilView()
}
