//
//  Perfil.view.swift
//  HikingTrip2
//
//  Created by Lorran Silva on 08/10/25.
//

import SwiftUI

struct PerfilView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State private var notificationsEnabled = true
    
    var body: some View {
        NavigationView {
            Form {
                // Perfil
                Section {
                    HStack(spacing: 16) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.accentColor)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("user")
                                .font(.headline)
                            Text("user@email.com")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 8)
                }
                
                // Preferências
                Section(header: Text("Preferências")) {
                    Toggle(isOn: $isDarkMode) {
                        Label("Modo escuro", systemImage: "moon.fill")
                    }
                    
                    Toggle(isOn: $notificationsEnabled) {
                        Label("Notificações", systemImage: "bell.fill")
                    }
                }
                
                // Outros ajustes
                Section(header: Text("Outros")) {
                    NavigationLink(destination: Text("Configurações de privacidade")) {
                        Label("Privacidade", systemImage: "lock.fill")
                    }
                    
                    NavigationLink(destination: Text("Sobre o aplicativo")) {
                        Label("Sobre o app", systemImage: "info.circle.fill")
                    }
                    
                    NavigationLink(destination: Text("Ajuda e suporte")) {
                        Label("Ajuda", systemImage: "questionmark.circle.fill")
                    }
                }
                
                // Botão de sair
                Section {
                    Button(role: .destructive) {
                        print("Usuário saiu")
                    } label: {
                        HStack {
                            Spacer()
                            Text("Sair da conta")
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Ajustes")
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    PerfilView()
}
