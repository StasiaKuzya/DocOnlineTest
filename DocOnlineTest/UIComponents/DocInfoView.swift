//
//  DocInfoView.swift
//  DocOnlineTest
//
//  Created by Анастасия on 10.04.2024.
//

import SwiftUI

struct DocInfoView: View {
    let docLastName: String
    let docFirstName: String
    let docMiddleName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(docLastName)
                .font(.headline)
            Text(docFirstName + " " + docMiddleName)
                .font(.headline)
        }
    }
}

#Preview {
    DocInfoView(
        docLastName: "Doe",
        docFirstName: "John",
        docMiddleName: "Johnovich")
}
