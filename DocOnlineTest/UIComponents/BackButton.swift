//
//  ChevronView.swift
//  DocOnlineTest
//
//  Created by Анастасия on 10.04.2024.
//

import SwiftUI

struct BackButton: View {
    var body: some View {
        Image(systemName: "chevron.left")
            .resizable()
            .font(.system(size: 16, weight: .bold))
            .tint(.black)
    }
}

#Preview {
    BackButton()
}
