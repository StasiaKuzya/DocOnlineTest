//
//  DocCostView.swift
//  DocOnlineTest
//
//  Created by Анастасия on 10.04.2024.
//

import SwiftUI

struct DocCostView: View {
    @Environment(\.presentationMode) var presentationMode
    let user: User
    
    var body: some View {
        VStack (alignment: .leading, spacing: 24) {
            DocOptionView(
                docTypeAppoint: "Видеоконсультация",
                docAppointmentTime: "30 мин",
                docPrice: user.videoChatPrice
            )
            
            DocOptionView(
                docTypeAppoint: "Чат с врачом",
                docAppointmentTime: "30 мин",
                docPrice: user.textChatPrice
            )
            
            DocOptionView(
                docTypeAppoint: "Приём в клинике",
                docAppointmentTime: "В клинике",
                docPrice: user.hospitalPrice
            )
            Spacer()
        }
        .padding(.top, 16)
        .navigationTitle("")
        .background(.docBackground)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItemGroup(placement: .topBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    BackButton()
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Стоимость услуг")
                    .font(.title3)
            }
        }
    }
}

//#Preview {
//    DocCostView(user: User())
//}
