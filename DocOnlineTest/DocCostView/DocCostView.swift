//
//  DocCostView.swift
//  DocOnlineTest
//
//  Created by Анастасия on 10.04.2024.
//

import SwiftUI

struct DocCostView: View {
    let docAppointmentTime: String
    let docPrice: String
    
    var body: some View {
        VStack (alignment: .leading,
                spacing: 24)
        {
            DocOptionView(
                docTypeAppoint: "Видеоконсультация",
                docAppointmentTime: "30 мин",
                docPrice: "600")
            
            DocOptionView(
                docTypeAppoint: "Чат с врачом",
                docAppointmentTime: "30 мин",
                docPrice: "600")
            
            DocOptionView(
                docTypeAppoint: "Приём в клинике",
                docAppointmentTime: "В клинике",
                docPrice: "600")
            Spacer()
        }
        .navigationTitle("")
        .background(.docBackground)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Стоимость услуг")
                    .font(.title3)
            }
        }
    }
}

#Preview {
    DocCostView(
        docAppointmentTime: "30 мин",
        docPrice: "600"
    )
}
