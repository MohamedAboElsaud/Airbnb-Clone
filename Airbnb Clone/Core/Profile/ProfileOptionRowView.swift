//
//  ProfileOptionRowView.swift
//  Airbnb Clone
//
//  Created by mohamed ahmed on 11/05/2025.
//

import SwiftUI

struct ProfileOptionRowView: View {
     let image: String
     let title: String

    var body: some View {
        VStack{
            HStack{
                Image(systemName: image)

                Text(title)
                    .font(.subheadline)
                Spacer()
                Image(systemName: "chevron.right")
            }
            Divider()
        }
    }
}

#Preview {
    ProfileOptionRowView(image: "xmark", title: "hhh")
}
