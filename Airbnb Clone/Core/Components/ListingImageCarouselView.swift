//
//  ListingImageCarouselView.swift
//  Airbnb Clone
//
//  Created by mohamed ahmed on 10/05/2025.
//

import SwiftUI

struct ListingImageCarouselView : View{
    var images : [String]
    var body: some View{
        TabView{
            ForEach(images,id: \.self){image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}
#Preview {
    ListingImageCarouselView(images: DeveloperPreview.shard.listings[0].imageURLs)
}
