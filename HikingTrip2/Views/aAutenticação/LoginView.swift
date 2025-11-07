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
            
            // Sobreposição para melhorar contraste do texto/botão (opcional)
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
                
                Text("Descubra trilhas e destinos incríveis")
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.9))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                
                Spacer()
                
                // Botão Entrar
                Button {
                    showHome = true
                } label: {
                    Text("Entrar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 160)
                        .padding(.vertical, 14)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 4)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 32)
                
            }
        }
        .fullScreenCover(isPresented: $showHome) {
            Navegation()
        }
    }
}

#Preview {
    LoginView()
}

