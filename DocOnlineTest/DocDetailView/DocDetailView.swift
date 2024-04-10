//
//  DocDetailView.swift
//  DocOnlineTest
//
//  Created by Анастасия on 10.04.2024.
//

import SwiftUI

struct DocDetailView: View {
    let docLastName: String
    let docFirstName: String
    let docMiddleName: String
    let docPhoto: String
    let workExperience: String
    let category: String
    let education: String
    let placeOfWork: String
    let docPrice: String
    let docBio: String
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                HStack(
                    alignment: .center,
                    spacing: 16
                ) {
                    Image(docPhoto)
                        .foregroundColor(.docGrey)
                        .background(.black)
                        .cornerRadius(25)
                        .frame(width: 50,
                               height: 50,
                               alignment: .center)
                    DocInfoView(
                        docLastName: docLastName,
                        docFirstName: docFirstName,
                        docMiddleName: docMiddleName)
                }
                DocDetailInfoView(
                    workExperience: workExperience,
                    category: category,
                    education: education,
                    placeOfWork: placeOfWork)
                
                PriceView(docPrice: docPrice)
                    .padding(.top, 0)
                
                Text(docBio)
                    .font(.system(size: 14))
                    .lineLimit(7)
                
                Spacer() //чтобы кнопка прижалась к низу
                
                Button(action: {
                    print("Кнопка была нажата")
                }) {
                    HStack {
                        Spacer()
                        Text("Записаться")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    .background(.docPink)
                    .cornerRadius(8)
                }
                .frame(height: 56)
                .padding(.bottom, 10)
            }
            .padding([.leading, .trailing, .top], 16)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Педиатр")
                    .font(.title3)
            }
        }
    }
}

#Preview {
    DocDetailView(
        docLastName: "Doe",
        docFirstName: "John",
        docMiddleName: "Johnovich",
        docPhoto: "mockPhoto",
        workExperience: "27",
        category: "Врач высшей категории",
        education: "1-й ММИ им. И.М. Сеченова",
        placeOfWork: "Детская клиника РебенОК",
        docPrice: "600",
        docBio: "ffffhcbb xnbjsjsnbdbh  dnjd cbj dj hcfhdnkcndehejkdncb  jksmnshekdb jjeken "
    )
}
