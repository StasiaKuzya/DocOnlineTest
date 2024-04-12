//
//  DocDetailInfoView.swift
//  DocOnlineTest
//
//  Created by Анастасия on 10.04.2024.
//

import SwiftUI

struct DocDetailInfoView: View {
    let workExperience: Int
    let category: String
    let education: String
    let placeOfWork: String
    
    var body: some View {
        HStack(
            alignment: .center,
            spacing: 12
        ) {
            
            VStack(
                alignment: .leading,
                spacing: 10
            ) {
                Image(systemName: "clock").resizable()
                    .frame(width: 24, height: 24)
                Image(systemName: "cross.case").resizable()
                    .frame(width: 24, height: 24)
                Image(systemName: "graduationcap").resizable()
                    .frame(width: 24, height: 24)
                Image("position").resizable()
                    .frame(width: 24, height: 24)
            }
            .foregroundColor(.docDarkGrey)
            .font(.system(size: 14))
            
            VStack(
                alignment: .leading,
                spacing: 10
            ) {
                Text("Опыт работы: \(workExperience) лет")
                    .frame(height: 24)
                Text(category)
                    .frame(height: 24)
                Text(education)
                    .frame(height: 24)
                Text(placeOfWork)
                    .frame(height: 24)
            }
            .foregroundColor(.docDarkGrey)
            .font(.system(size: 14))
        }
    }
}

#Preview {
    DocDetailInfoView(
        workExperience: 27,
        category: "Врач высшей категории",
        education: "1-й ММИ им. И.М. Сеченова",
        placeOfWork: "Детская клиника РебенОК")
}
