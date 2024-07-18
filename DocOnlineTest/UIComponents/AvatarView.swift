//
//  AvatarView.swift
//  DocOnlineTest
//
//  Created by Анастасия on 18.07.2024.
//

import SwiftUI
import Kingfisher

struct AvatarView: View {
    let user: User?
    
    var body: some View {
        KFImage(user?.avatar != nil ? URL(string: user?.avatar! ?? "") : nil)
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
            .clipShape(Circle())
    }
}

#Preview {
    AvatarView(user: nil)
}
