//
//  ActionButtonView.swift
//  DocOnlineTest
//
//  Created by Анастасия on 18.07.2024.
//

import SwiftUI

struct ActionButtonView: View {
    var body: some View {
        Text("Записаться")
            .frame(maxWidth: .infinity)
            .frame(height: 47)
            .background(RoundedRectangle(cornerRadius: 8)
                .fill(.docPink))
            .foregroundColor(.white)
    }
}

#Preview {
    ActionButtonView()
}
