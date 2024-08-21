//
//  MainNavBar.swift
//  DocOnlineTest
//
//  Created by Анастасия on 18.07.2024.
//

import SwiftUI

struct MainNavBar: View {
    var body: some View {
        NavigationView {
            MainView()
                .navigationBarBackButtonHidden()
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .background(Color("docBackground"))
                .navigationBarItems(leading: Button(action: {}) { BackButton() })
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Педиатры")
                            .font(.title3)
                    }
                }
        }
    }
}

#Preview {
    MainNavBar()
}
