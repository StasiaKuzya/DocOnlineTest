//
//  DocDetailView.swift
//  DocOnlineTest
//
//  Created by Анастасия on 10.04.2024.
//

import SwiftUI

struct DocDetailView: View {
    let user: User
//    let workExpirience: WorkExpirience
//    let higherEducation: HigherEducation
  
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            HStack(
                alignment: .center,
                spacing: 16
            ) {
                Image(user.avatar ?? "")
                    .foregroundColor(.docGrey)
                    .background(.black)
                    .cornerRadius(25)
                    .frame(width: 50,
                           height: 50,
                           alignment: .center)
                DocInfoView(
                    docLastName: user.lastName,
                    docFirstName: user.firstName,
                    docMiddleName: user.middleName)
            }
            DocDetailInfoView(
                workExperience: 0,
//                    (workExpirience.endDate ?? 0 - workExpirience.startDate)/365,
                category: String(user.category),
                education: "TODO",
                placeOfWork: "TODO")
            
            PriceView(docPrice: 0
//                        min(Int(user.homePrice), Int(user.hospitalPrice), Int(user.textChatPrice), Int(user.videoChatPrice))
            )
                .padding(.top, 0)
            
            Text(user.rankLabel)
                .font(.system(size: 14))
                .lineLimit(7)
            
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
}

//#Preview {
//    DocDetailView(user: User())
//}
