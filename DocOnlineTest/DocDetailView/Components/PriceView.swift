//
//  PriceView.swift
//  DocOnlineTest
//
//  Created by Анастасия on 10.04.2024.
//

import SwiftUI

struct PriceView: View {
    let docPrice: Int
    
    var body: some View {
        HStack(
            alignment: .center,
            spacing: 16
        ) {
            Text("Стоимость услуг")
                .bold()
            Spacer() // Этот элемент будет раздвигать тексты к краям HStack
            Text("от \(docPrice) ₽")
                .bold()
        }
        .font(.system(size: 16))
        .frame(maxWidth: .infinity)
        .frame(height: 60)
        .padding(.horizontal, 16)
        .background(.docWhite)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.docGrey, lineWidth: 1)
        )
        .cornerRadius(8)
    }
}

#Preview {
    PriceView(docPrice: 600)
}
