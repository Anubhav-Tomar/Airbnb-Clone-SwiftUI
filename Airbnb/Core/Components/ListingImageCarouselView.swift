//
//  ListingImageCarouselView.swift
//  Airbnb
//
//  Created by Anubhav Tomar on 10/09/24.
//

import SwiftUI

struct ListingImageCarouselView: View {

    let listing: Listing
    
    var body: some View {
        TabView {
            ForEach(listing.images, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
//        .frame(height: 320)
//        .clipShape(RoundedRectangle(cornerRadius: 10))
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(listing: DeveloperPreview.shared.listings[0])
}
