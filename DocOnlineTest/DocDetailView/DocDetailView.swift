//
//  DocDetailView.swift
//  DocOnlineTest
//
//  Created by Анастасия on 10.04.2024.
//

import SwiftUI
import Kingfisher

struct DocDetailView: View {
    let user: User
  
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            HStack(
                alignment: .center,
                spacing: 16
            ) {
                KFImage(user.avatar != nil ? URL(string: user.avatar!) : nil)
                    .resizable()
                    .placeholder {
                        Image(systemName: "person.circle.fill").resizable()
                            .font(.body)
                            .foregroundColor(.docGrey)
                            .background(.docDarkGrey)
                    }
                    .cancelOnDisappear(true)
                    .scaledToFill()
                    .frame(width: 50,
                           height: 50,
                           alignment: .center)
                    .cornerRadius(25)
                
                DocInfoView(
                    docLastName: user.lastName,
                    docFirstName: user.firstName,
                    docMiddleName: user.middleName)
            }
            
            DocDetailInfoView(
                workExperience: user.seniority,
                category: user.categoryLabel,
                education: user.educationTypeLabel ?? EducationTypeLabel(id: 0, name: "Нет данных об образовании"),
                placeOfWork: user.workExpirience.last ?? WorkExpirience(id: 0,
                                                                        organization: "Нет данных об организации",
                                                                        position: "Нет данных о должности",
                                                                        startDate: 0,
                                                                        endDate: 0,
                                                                        untilNow: false,
                                                                        isModerated: false)
                )
            
            PriceView(docPrice: findMinPrice(user: user) ?? 0)
                .padding(.top, 0)
            
            Text("Проводит диагностику и лечение терапевтических больных. Осущетсвляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.")
                .font(.system(size: 14))
                .lineLimit(7)
                .lineSpacing(8)
            
            Spacer() //чтобы кнопка прижалась к низу
            
            NavigationLink(destination: DocCostView(user: user)) {
                HStack {
                    Spacer()
                    Text("Записаться")
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                .background(Color.docPink)
                .cornerRadius(8)
            }
            .frame(height: 56)
            .padding(.bottom, 10)
        }
        .padding([.leading, .trailing, .top], 16)
        .background(Color.docBackground)
        
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
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
