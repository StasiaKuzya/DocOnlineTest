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
    let docPrice: String
    
    var body: some View {
        VStack (alignment: .leading,
                spacing: 12)
        {
            Text("\(docTypeAppoint)")
                .bold()
            PriceOptionView(
                docAppointmentTime: docAppointmentTime,
                docPrice: docPrice)
        }
        .padding([.leading, .trailing], 16)
    }
}

#Preview {
    DocOptionView(
        docTypeAppoint: "Видеоконсультация",
        docAppointmentTime: "30 мин",
        docPrice: "600"
        )
}
