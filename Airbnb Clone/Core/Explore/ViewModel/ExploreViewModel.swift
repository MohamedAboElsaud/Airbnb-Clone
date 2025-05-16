//
//  ExploreViewModel.swift
//  Airbnb Clone
//
//  Created by mohamed ahmed on 11/05/2025.
//

import Foundation
class ExploreViewModel: ObservableObject{
    @Published var listings = [Listing]()
    @Published var searchLocation = ""
    private let service: ExploreService
    private var listingsCopy = [Listing]()
    init(service: ExploreService) {
        self.service = service
        Task {
            await fetchListing()
        }
    }

    func fetchListing() async{
        do {
            self.listings = try await service.fetchListings()
            listingsCopy = listings
        } catch  {
            print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }

    func updateListingsForLocation() {

        let filteredListings = listings.filter {
            $0.city.lowercased().contains(searchLocation.lowercased()) ||
            $0.state.lowercased().contains(searchLocation.lowercased())
        }
        self.listings = filteredListings.isEmpty ? listingsCopy : filteredListings
    }
}
