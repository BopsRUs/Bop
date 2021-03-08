//
//  FollowerView.swift
//  Bop
//
//  Created by Sam Winiarski on 3/7/21.
//

import SwiftUI

struct FollowerView: View {
    
    @State var users: [String] = ["Sam", "Justin", "Luke", "JH", "Aidan"]
    @State var username: String = "username here"
    @State var followers: Int = 420
    @State var following: Int = 69
    @State var followers_selected: Bool = true
    @State var following_selected: Bool = false
    
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
        //FollowerView(followers_selected: Bool, following_selected: Bool)
        FollowerView()
    }
}
