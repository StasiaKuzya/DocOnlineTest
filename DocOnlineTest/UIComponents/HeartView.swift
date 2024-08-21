//
//  HeartView.swift
//  DocOnlineTest
//
//  Created by Анастасия on 18.07.2024.
//

import SwiftUI

struct HeartView: View {
    var body: some View {
        Image(systemName: "heart")
            .resizable()
            .foregroundColor(Color.docSilver)
            .frame(width: 20, height: 17.16, alignment: .center)
    }
}

#Preview {
    HeartView()
}
