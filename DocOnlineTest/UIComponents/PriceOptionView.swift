//
//  PriceOptionView.swift
//  DocOnlineTest
//
//  Created by Анастасия on 10.04.2024.
//

import SwiftUI

struct PriceOptionView: View {
    let docAppointment: String
    let docPrice: Int
    
    var body: some View {
        HStack(spacing: 16) {
            Text("\(docAppointment)")
            Spacer()
            Text(docPriceLabel())
                .bold()
        }
        .font(.subheadline)
        .frame(maxWidth: .infinity)
        .frame(height: 56)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.docWhite)
                .stroke(Color.docGrey, lineWidth: 1))
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
        docAppointment: "30 мин",
        docPrice: 600
    )
}
