//
//  StarRatingView.swift
//  DocOnlineTest
//
//  Created by Анастасия on 09.04.2024.
//

import SwiftUI

struct StarRatingView: View {
    var rating: Int
    
    var body: some View {
        HStack(
            alignment: .center,
            spacing: 2.4
        ) {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12, height: 12)
                    .foregroundColor(index <= rating ? .docPink : .docDarkGrey)
            }
        }
    }
}

#Preview {
    StarRatingView(rating: 4)
}
