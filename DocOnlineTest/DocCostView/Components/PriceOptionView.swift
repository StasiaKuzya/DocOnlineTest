//
//  PriceOptionView.swift
//  DocOnlineTest
//
//  Created by Анастасия on 10.04.2024.
//

import SwiftUI

struct PriceOptionView: View {
    let docAppointmentTime: String
    let docPrice: Int
    
    var body: some View {
        HStack(
            alignment: .center,
            spacing: 16
        ) {
            Text("\(docAppointmentTime)")
            Spacer() // Этот элемент будет раздвигать тексты к краям HStack
            Text(docPriceLabel())
                .bold()
        }
        .font(.system(size: 16))
        .frame(maxWidth: .infinity)
        .frame(height: 56)
        .padding(.horizontal, 16)
        .background(.docWhite)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.docGrey, lineWidth: 1)
        )
        .cornerRadius(8)
    }
    
    private func docPriceLabel() -> String {
        var docPiceLabel: String
        if docPrice == 0 {
            docPiceLabel = "-"
        } else {
            docPiceLabel = "от \(docPrice) ₽"
        }
        return docPiceLabel
    }
}

#Preview {
    PriceOptionView(
        docAppointmentTime: "30 мин",
        docPrice: 600
    )
}
