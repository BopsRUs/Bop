//
//  MainView.swift
//  Bop
//
//  Created by Justin Hurley on 2/17/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem {
                    Label("Stocks", systemImage: "bitcoinsign.circle")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass.circle")
                }
            SocialView()
                .tabItem {
                    Label("Social", systemImage:"flame.fill")
                }
            ProfileView()
                .tabItem{
                    Label("Profile",
                          systemImage: "person.crop.circle")
                }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
