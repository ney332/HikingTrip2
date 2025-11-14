# 🥾 HikingTrip  
**Descubra, explore e registre trilhas incríveis.**

HikkingTrip é um aplicativo iOS desenvolvido inteiramente em **Swift**, que conecta aventureiros e amantes da natureza a trilhas de todo o mundo.  
O app utiliza uma **API em Node.js** para fornecer dados atualizados sobre rotas, localizações e níveis de dificuldade, além de integração com **MapKit** e **CoreLocation** para navegação em tempo real.

---

## 🚀 Funcionalidades

- 🗺️ **Mapa interativo** com integração ao MapKit.  
- 📍 **Localização em tempo real** do usuário (usando CoreLocation).  
- 🧭 **Exploração de trilhas** com informações detalhadas (distância, dificuldade, altitude, duração).  
- 🔖 **Favoritar trilhas** e salvar trajetos
- 🌐 **Integração com backend** Node.js para listagem e atualização de trilhas.  

---

## 🛠️ Tecnologias Utilizadas

### 📱 **Frontend (iOS App)**
- Swift / SwiftUI  
- MapKit  
- CoreLocation  
- Combine  
- URLSession (para comunicação HTTP com a API)  
- Codable (para decodificação de dados JSON)
- Observable 

### ⚙️ **Backend (API)**
- Node.js (v18+)  
- Javascript puro  
---

## 🧩 Estrutura do Projeto
HikkingTrip/

├── HikkingTripApp.swift # Ponto de entrada do app

├── Models/ # Estruturas de dados (Trail, User, Review)

├── Views/ # Telas em SwiftUI

├── ViewModels/ # Lógica de negócios e integração com API

├── Services/

│ ├── API.swift # Conexão com a API Node.js

└── Assets/ # Ícones e imagens

Desenvolvido como projeto final do curso Swift Foundation 2025.2 - PUC-RJ
---
👨‍💻 Autor

Lorran Silva
Desenvolvedor iOS | Estudante de Sistemas de Informação
📍 Rio de Janeiro, Brasil 
