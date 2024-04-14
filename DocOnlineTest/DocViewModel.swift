//
//  DocViewModel.swift
//  DocOnlineTest
//
//  Created by Анастасия on 11.04.2024.
//

import Foundation

class DocViewModel: ObservableObject {
    @Published var users: [User] = []
    
    private var networkClient = NetworkClient()
    
    func fetchPosts() {
        networkClient.fetchData { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let newUsers):
                    self?.users = newUsers
                case .failure(let error):
                    print("Ошибка при загрузке пользователей: \(error.localizedDescription)")
                }
            }
        }
    }
}
