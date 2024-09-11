//
//  ExploreService.swift
//  Airbnb
//
//  Created by Anubhav Tomar on 10/09/24.
//

import Foundation

class ExploreService {
    func fetchListings() async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
