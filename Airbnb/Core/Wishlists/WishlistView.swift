//
//  WishlistView.swift
//  Airbnb
//
//  Created by Anubhav Tomar on 10/09/24.
//

import SwiftUI

struct WishlistView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Log in to view your wishlists.")
                        .font(.headline)
                    
                    Text("You can create view or edit wishlists once you'he logged in.")
                        .font(.footnote)
                }
                
                Button {
                    
                }   label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Wishlist ")
        }
    }
}

#Preview {
    WishlistView()
}
