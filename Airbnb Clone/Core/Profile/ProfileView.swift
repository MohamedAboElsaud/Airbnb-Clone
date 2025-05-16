//
//  ProfileView.swift
//  Airbnb Clone
//
//  Created by mohamed ahmed on 11/05/2025.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {

        VStack(alignment: .leading,spacing: 32) {
            VStack(alignment: .leading,spacing: 8) {
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("Login to start planning your next trip")
            }

            Button {

            } label: {
                Text("Log in")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .frame(height: 48,alignment: .center)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .background(Color.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            HStack{
                Text("Don't have an account?")

                Text("Sign up")
                    .underline()
                    .fontWeight(.semibold)
            }
            .font(.caption)

            VStack(spacing: 24) {
                ProfileOptionRowView(image: "gear", title: "Settings")
                ProfileOptionRowView(image: "gear", title: "Accessibility")
                ProfileOptionRowView(image: "questionmark.circle", title: "visit the help center")
            }

        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
