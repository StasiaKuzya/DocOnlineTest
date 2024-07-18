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
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 10) {
                Image(systemName: "clock")
                Image(systemName: "cross.case")
                Image(systemName: "graduationcap")
                Image("position")
            }
            .frame(width: 24, height: 24 * 4)

            VStack( alignment: .leading,spacing: 10) {
                Text("Опыт работы: \(workExperience.getYearsString() ?? "")")
                Text("\(docCategory())")
                Text(education.name)
                Text(placeOfWork.organization)
            }
            .frame(height: 24 * 4)
        }
        .font(.subheadline)
        .foregroundColor(.docDarkGrey)
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
