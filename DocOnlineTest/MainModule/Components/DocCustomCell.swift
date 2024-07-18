//
//  DocCustomCell.swift
//  DocOnlineTest
//
//  Created by Анастасия on 09.04.2024.
//

import SwiftUI

struct DocCustomCell: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            headerView
            NavigationLink(destination: DocDetailView(user: user)) {
                ActionButtonView()
            }
        }
        .padding(.all, 16)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.docWhite)
                .stroke(Color.docGrey, lineWidth: 1))
    }
    
    var headerView: some View {
        HStack(alignment: .top, spacing: 16) {
            AvatarView(user: user)
            infoView
            HeartView()
        }
    }
    
    var infoView: some View {
        VStack(alignment: .leading, spacing: 8) {
            DocInfoView(
                docLastName: user.lastName,
                docFirstName: user.firstName,
                docMiddleName: user.middleName
            )
            StarRatingView(rating: user.ratingsRating)
            Text("Педиатр · стаж \(user.seniority.getYearsString() ?? "")")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("от \(findMinPrice(user: user) ?? 0) ₽")
                .font(.headline)
        }
        .frame(width: 227, height: 126, alignment: .leading)
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
//    DocCustomCell(user: User())
//}
