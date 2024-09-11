//
//  MainTabView.swift
//  Airbnb
//
//  Created by Anubhav Tomar on 10/09/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass") }
            
            WishlistView()
                .tabItem { Label("Wishlist", systemImage: "heart")
                    .environment(\.symbolVariants, .none)}
            
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person")
                    .environment(\.symbolVariants, .none)}
        }
        .onAppear {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}

#Preview {
    MainTabView()
}
