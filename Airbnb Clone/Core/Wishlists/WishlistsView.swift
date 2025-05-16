//
//  WishlistsView.swift
//  Airbnb Clone
//
//  Created by mohamed ahmed on 11/05/2025.
//

import SwiftUI

struct WishlistsView: View {
    var body: some View {
        NavigationStack{

            ScrollView {
                VStack(alignment: .leading,spacing: 32) {
                    VStack(alignment: .leading,spacing:4) {
                        Text("Log in to view your wishlists")
                            .font(.headline)
                        Text("you can create, view or edit wishlists once you've logged in")
                            .font(.footnote)
                    }
                    .padding()
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
                    Spacer()
                }
                .padding()
                .navigationBarTitle("Wishlists")
            }

        }
    }
}

#Preview {
    WishlistsView()
}
