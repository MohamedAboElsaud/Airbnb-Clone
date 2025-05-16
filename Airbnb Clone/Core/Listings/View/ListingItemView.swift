//
//  ListingItemView.swift
//  Airbnb Clone
//
//  Created by mohamed ahmed on 09/05/2025.
//

import SwiftUI

struct ListingItemView: View {
    @State var listing: Listing
    var body: some View {
        VStack(spacing: 8){
            ListingImageCarouselView(images: listing.imageURLs)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(alignment: .topTrailing) {
                    Button {
                        listing
                            .isFavorite.toggle()
                    } label: {
                        Image(systemName: listing
                            .isFavorite ? "heart.fill" : "heart")
                            .font(.largeTitle)
                            .foregroundStyle(listing
                                .isFavorite ? .red : .black)
                            .padding()
                            .opacity(0.9)
                            .fontWeight(.thin)
                            .shadow(color: .black.opacity(0.4), radius: 2, x: 0, y: 0)

                    }
                }

            HStack(alignment: .top){
                VStack(alignment: .leading){
                    Text(listing.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)

                    Text("\(listing.city), \(listing.state)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(listing.address)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    HStack(spacing:4){
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                    .foregroundStyle(.black)

                }
                Spacer()
                HStack(spacing: 2){
                    Image(systemName: "star.fill")
                    Text(String(format: "%.2f", listing.rating))
                }
                .foregroundStyle(.black)

            }
            .font(.footnote)
        }
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shard.listings[0])
}
