//
//  FollowerView.swift
//  Bop
//
//  Created by Sam Winiarski on 3/7/21.
//

import SwiftUI

struct FollowerView: View {
    
    @State var users: [String] = []
    @State var username: String = "sam_winiarski"
    @State var followers: Int = 69
    @State var following: Int = 420
    @State var followers_selected: Bool = true
    @State var following_selected: Bool = false
    
//    @State var users: [String]
//    @State var username: String
//    @State var followers: Int
//    @State var following: Int
//    @State var followers_selected: Bool
//    @State var following_selected: Bool
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                VStack {
                    Button("\(followers) Followers") {
                        followers_selected = true
                        following_selected = false
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(followers_selected ? Color.blue : Color.white)
                }
                //Spacer()
                VStack {
                    Button("\(following) Following") {
                        following_selected = true
                        followers_selected = false
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(following_selected ? Color.blue : Color.white)
                }
                Spacer()
            }
            
            List(users, id: \.self) { follower in
                Text(follower)
            }
            .navigationTitle(username)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FollowerView_Previews: PreviewProvider {
    static var previews: some View {
        FollowerView()
//        FollowerView(users: [String], username: String, followers: Int, following: Int, followers_selected: Bool, following_selected: Bool)
    }
}
