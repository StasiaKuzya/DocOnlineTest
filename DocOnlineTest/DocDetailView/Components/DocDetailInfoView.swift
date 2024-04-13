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
    let education: EducationTypeLabel
    let placeOfWork: WorkExpirience
    
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
                Text("\(docCategory())")
                    .frame(height: 24)
                Text(education.name)
                    .frame(height: 24)
                Text(placeOfWork.organization)
                    .frame(height: 24)
            }
            .foregroundColor(.docDarkGrey)
            .font(.system(size: 14))
        }
    }
    
    private func docCategory() -> String {
        var categoryLabel = ""
        if category == "нет" {
            categoryLabel = "Нет данных о категории врача"
        } else {
            categoryLabel = "\(category)".capitalized + " категория врача"
        }
        return categoryLabel
    }
}

//#Preview {
//    DocDetailInfoView(
//        workExperience: 27,
//        category: "Высшая",
//        education: "1-й ММИ им. И.М. Сеченова",
//        placeOfWork: "Детская клиника РебенОК")
//}
