//
//  TabView.swift
//  DocOnlineTest
//
//  Created by Анастасия on 18.07.2024.
//

import SwiftUI

enum Tabs: Hashable {
    case main
    case appointments
    case chats
    case profile
}

final class Router: ObservableObject {
    @Published var selectedTab: Tabs = .main
    static var shared: Router = .init()
    init() {}
    
    func moveToTab(tab: Tabs) {
        
    }
}

struct TabBarView: View {
    @ObservedObject var router: Router
    
    init(router: Router) {
        self.router = router
        configureTabBarAppearance()
    }
    
    var body: some View {
        TabView(selection: $router.selectedTab) {
            MainNavBar()
                .tabItem { Label("Главная", systemImage: "pills.fill") }
                .tag(Tabs.main)
            Text("")
                .tabItem { Label("Приёмы", systemImage: "tablecells.fill.badge.ellipsis") }
                .tag(Tabs.appointments)
            Text("")
                .tag(Tabs.chats)
                .tabItem { Label("Чат", systemImage: "bubble.fill") }
            Text("")
                .tag(Tabs.profile)
                .tabItem { Label("Профиль", systemImage: "person") }

        }
        .accentColor(.docPink)
    }
    
    private func configureTabBarAppearance() {
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.backgroundColor = .docWhite
        tabBarAppearance.unselectedItemTintColor = .docDarkGrey
    }
}

#Preview {
    TabBarView(router: Router.init())
}
