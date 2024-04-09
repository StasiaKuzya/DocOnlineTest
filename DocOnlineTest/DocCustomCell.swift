//
//  DocCustomCell.swift
//  DocOnlineTest
//
//  Created by Анастасия on 09.04.2024.
//

import SwiftUI

struct DocCustomCell: View {
    let docLastName: String
    let docFirstName: String
    let docMiddleName: String
    let docRating: String
    let specialization: String
    let workExperience: String
    let docPrice: String
    let docPhoto: String
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 8
        ) {
            HStack(
                alignment: .top,
                spacing: 16
            ) {
                Image(docPhoto)
                    .foregroundColor(.docGrey)
                    .background(.black)
                    .cornerRadius(25)
                    .frame(width: 50,
                           height: 50,
                           alignment: .center)
                
                VStack(
                    alignment: .leading,
                    spacing: 8
                ) {
                    Text(docLastName)
                        .font(.headline)
                    Text(docFirstName + " " + docMiddleName)
                        .font(.headline)
                    StarRatingView(rating: Int(docRating) ?? 0)
                    Text(specialization + " · стаж " + workExperience + " лет")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("от " + docPrice + "₽")
                        .font(.headline)
                }
                .frame(width: 227,
                       height: 126,
                       alignment: .leading)
                Image(systemName: "heart").resizable()
                    .foregroundColor(.docSilver)
                    .frame(width: 20,
                           height: 17.16,
                           alignment: .center)
            }
            Button(action: {
                print("Кнопка была нажата")
            }) {
                Text("Записаться")
            }
            .frame(width: 333, height: 47, alignment: .center)
            .background(.docPink)
            .cornerRadius(8)
            .foregroundColor(.white)
    }
        .padding([.leading, .trailing, .bottom], 16)
        .padding([.top], 20)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.docGrey, lineWidth: 1)
        )
    }
}

#Preview {
    DocCustomCell(
        docLastName: "Doe",
        docFirstName: "John",
        docMiddleName: "Johnovich",
        docRating: "4",
        specialization: "Phisitian",
        workExperience: "27",
        docPrice: "600",
        docPhoto: "mockPhoto")
}
