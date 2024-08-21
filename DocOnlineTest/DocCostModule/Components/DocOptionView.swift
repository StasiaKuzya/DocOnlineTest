//
//  DocOptionView.swift
//  DocOnlineTest
//
//  Created by Анастасия on 10.04.2024.
//

import SwiftUI

struct DocOptionView: View {
    let docTypeAppoint: String
    let docAppointmentTime: String
    let docPrice: Int
    
    var body: some View {
        VStack (alignment: .leading, spacing: 12) {
            Text("\(docTypeAppoint)")
                .bold()
            PriceOptionView(
                docAppointment: docAppointmentTime,
                docPrice: docPrice)
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    DocOptionView(
        docTypeAppoint: "Видеоконсультация",
        docAppointmentTime: "30 мин",
        docPrice: 600
        )
}
