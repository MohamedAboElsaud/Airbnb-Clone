//
//  ExploreService.swift
//  Airbnb Clone
//
//  Created by mohamed ahmed on 11/05/2025.
//

import Foundation

class ExploreService{
    func fetchListings() async throws -> [Listing] {
        return DeveloperPreview.shard.listings
    }
}
