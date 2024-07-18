//
//  DocDetailView.swift
//  DocOnlineTest
//
//  Created by Анастасия on 10.04.2024.
//

import SwiftUI

struct DocDetailView: View {
    @State private var isLinkActive = false
    @Environment(\.presentationMode) var presentationMode
    let user: User
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            HStack(spacing: 16) {
                AvatarView(user: user)
                DocInfoView(
                    docLastName: user.lastName,
                    docFirstName: user.firstName,
                    docMiddleName: user.middleName)
            }
            
            DocDetailInfoView(
                workExperience: user.seniority,
                category: user.categoryLabel,
                education: user.educationTypeLabel ?? EducationTypeLabel(id: 0,
                                                                         name: "Нет данных об образовании"),
                placeOfWork: user.workExpirience.last ?? WorkExpirience(id: 0,
                                                                        organization: "Нет данных об организации",
                                                                        position: "Нет данных о должности",
                                                                        startDate: 0,
                                                                        endDate: 0,
                                                                        untilNow: false,
                                                                        isModerated: false)
            )
            
            PriceOptionView(docAppointment: "Стоимость услуг", docPrice: (findMinPrice(user: user) ?? 0))
                .padding(.top, 0)
            
            Text("Проводит диагностику и лечение терапевтических больных. Осущетсвляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.")
                .font(.caption)
                .lineLimit(7)
                .lineSpacing(8)
            
            Spacer()
            
            NavigationLink(destination: DocCostView(user: user)) {
                ActionButtonView()
                    .padding(.bottom, 10)
            }
        }
        .padding([.horizontal, .top], 16)
        .background(Color.docBackground)
        .navigationTitle("")
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
                Text("Педиатр")
                    .font(.title3)
            }
        }
    }
    
    private func findMinPrice(user: User) -> Int? {
        let prices = [user.homePrice, user.hospitalPrice, user.textChatPrice, user.videoChatPrice]
        let nonZeroPrices = prices.filter { $0 != 0 }
        if let minPrice = nonZeroPrices.min() {
            return minPrice
        } else {
            return nil
        }
    }
}

//#Preview {
//    DocDetailView(user: User())
//}
