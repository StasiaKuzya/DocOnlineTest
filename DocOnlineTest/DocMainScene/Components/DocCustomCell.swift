//
//  DocCustomCell.swift
//  DocOnlineTest
//
//  Created by Анастасия on 09.04.2024.
//

import SwiftUI
import Kingfisher

struct DocCustomCell: View {
    let user: User

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            headerView
            actionButton
        }
        .padding([.leading, .trailing, .bottom], 16)
        .padding(.top, 20)
        .background(Color.docWhite)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.docGrey, lineWidth: 1)
        )
        .cornerRadius(8)
    }

    var headerView: some View {
        HStack(alignment: .top, spacing: 16) {
            avatarView
            infoView
            favoriteView
        }
    }

    var avatarView: some View {
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
            .frame(width: 50, height: 50, alignment: .center)
            .cornerRadius(25)
    }

    var infoView: some View {
        VStack(alignment: .leading, spacing: 8) {
            DocInfoView(
                docLastName: user.lastName,
                docFirstName: user.firstName,
                docMiddleName: user.middleName
            )
            StarRatingView(rating: user.ratingsRating)
            
            Text("Педиатр · стаж \(user.seniority) лет")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("от \(findMinPrice(user: user) ?? 0) ₽")
                .font(.headline)
        }
        .frame(width: 227, height: 126, alignment: .leading)
    }

    var favoriteView: some View {
        Image(systemName: "heart")
            .resizable()
            .foregroundColor(Color.docSilver)
            .frame(width: 20, height: 17.16, alignment: .center)
    }

    var actionButton: some View {
        Button(action: {
            print("Кнопка была нажата")
        }) {
            Text("Записаться")
        }
        .frame(width: 333, height: 47)
        .background(Color.docPink)
        .cornerRadius(8)
        .foregroundColor(.white)
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
