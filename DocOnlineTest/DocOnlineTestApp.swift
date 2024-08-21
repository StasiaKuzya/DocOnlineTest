//
//  DocOnlineTestApp.swift
//  DocOnlineTest
//
//  Created by Анастасия on 09.04.2024.
//

import SwiftUI

@main
struct DocOnlineTestApp: App {
    @StateObject private var router: Router = .init()
    
    var body: some Scene {
        WindowGroup {
            LaunchScreenView(router: router)
        }
    }
}

#Preview {
    LaunchScreenView(router: Router.init())
}
