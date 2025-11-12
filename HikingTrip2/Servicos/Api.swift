//
//  Api.swift
//  HikingTrip2
//
//  Created by User on 07/11/25.
//

import Foundation

class APITrailService {
    private let baseURL = "https://api-trilhas-five.vercel.app"

    func fetchTrails(completion: @escaping ([Trail]) -> Void) {
        guard let url = URL(string: "\(baseURL)/trails") else {
            print("URL inválida")
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let trails = try JSONDecoder().decode([Trail].self, from: data)
                    DispatchQueue.main.async {
                        completion(trails)
                    }
                } catch {
                    print("Erro ao decodificar JSON:", error)
                }
            } else if let error = error {
                print("Erro na requisição:", error.localizedDescription)
            }
        }.resume()
    }

    func searchTrails(by name: String, completion: @escaping ([Trail]) -> Void) {
        guard let url = URL(string: "\(baseURL)/trails?name=\(name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") else {
            print("URL inválida")
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let trails = try JSONDecoder().decode([Trail].self, from: data)
                    DispatchQueue.main.async {
                        completion(trails)
                    }
                } catch {
                    print("Erro ao decodificar JSON:", error)
                }
            } else if let error = error {
                print("Erro na requisição:", error.localizedDescription)
            }
        }.resume()
    }

}
