//
//  FollowerView.swift
//  Bop
//
//  Created by Sam Winiarski on 3/7/21.
//

import SwiftUI

struct FollowerView: View {
    
    @State var followers: [String] = ["Sam", "Justin", "Luke", "JH", "Aidan"]
    @State var username: String = "Sam"
    
    var body: some View {
        
        NavigationView {
            List(followers, id: \.self) { follower in
                Text(follower)
            }
            .navigationTitle(username)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: NavigationLink(destination: ProfileView()) {
                Image(systemName: "arrow.left")
            })
            
        }
        
    }
}

struct FollowerView_Previews: PreviewProvider {
    static var previews: some View {
        FollowerView()
    }
}
