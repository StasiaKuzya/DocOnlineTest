//
//  LaunchScreenView.swift
//  DocOnlineTest
//
//  Created by Анастасия on 14.04.2024.
//

import SwiftUI

struct LaunchScreenView: View {
    
    @State private var isActive = false
    
    var body: some View {
        Group {
            if isActive {
                MainView()
            } else {
                ZStack {
                    Color.docWhite.ignoresSafeArea()

                    Text("Doc\nOnline")
                        .font(.system(size: 80, weight: .bold))
                        .foregroundColor(.docWhite)
                        .frame(width: 300, height: 300)
                        .background(.docPink)
                        .cornerRadius(12)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                self.isActive = true
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    LaunchScreenView()
}
