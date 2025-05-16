//
//  ExploreView.swift
//  Airbnb Clone
//
//  Created by mohamed ahmed on 09/05/2025.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView: Bool = false
    @StateObject private var listingsViewModel = ExploreViewModel(service: ExploreService())
    var body: some View {
        NavigationStack{
            if showDestinationSearchView{
                DestinationSearchView(showSearch: $showDestinationSearchView, viewModel: listingsViewModel)
            }else{
                ScrollView {
                    SearchAndFilterBar(location: $listingsViewModel.searchLocation)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        }
                    LazyVStack(spacing: 32){
                        ForEach(listingsViewModel.listings,id: \.self){listing in
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing)
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing: listing)
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
