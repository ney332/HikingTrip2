//
//  LoginView.swift
//  HikingTrip2
//
//  Created by Lorran Silva on 08/10/25.
//

import SwiftUI

struct LoginView: View {
    
    @State private var showHome = false
    
    var body: some View {
        ZStack {
            // Fundo com imagem cobrindo a tela toda
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            // Sobreposição para melhorar contraste do texto
            LinearGradient(
                colors: [Color.black.opacity(0.4), Color.black.opacity(0.2), Color.clear],
                startPoint: .bottom,
                endPoint: .top
            )
            .ignoresSafeArea()
            
            // Conteúdo principal
            VStack(spacing: 10) {
                
                // Título
                Text("HikingTrip")
                    .font(.system(size: 44, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .shadow(radius: 8)
                    .padding(.top, 70)
                
                Text("Seus melhores momentos")
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.9))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                
                Spacer()
                
                // Indicador de carregamento
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1.5)
                    .padding(.bottom, 32)
            }
        }
        .fullScreenCover(isPresented: $showHome) {
            Navegation()
        }
        .onAppear {
            // Espera 2.5 segundos e navega para a home automaticamente
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                showHome = true
            }
        }
    }
}

#Preview {
    LoginView()
}
