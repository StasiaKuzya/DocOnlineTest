//
//  NetworkClient.swift
//  DocOnlineTest
//
//  Created by Анастасия on 11.04.2024.
//

import Foundation

class NetworkClient {
    private let url = URL(string: "https://api.jsonbin.io/v3/b/655b754e0574da7622c94aa4")!

    func fetchData(onCompletion: @escaping (Result<[User], Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    onCompletion(.failure(error))
                }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    onCompletion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Данные не были получены."])))
                }
                return
            }

            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(DoctorInfo.self, from: data)
                DispatchQueue.main.async {
                    onCompletion(.success(result.record.data.users))
                }
            } catch {
                DispatchQueue.main.async {
                    onCompletion(.failure(error))
                }
            }
        }.resume()
    }
}
