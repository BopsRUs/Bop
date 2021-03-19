//
//  FollowerView.swift
//  Bop
//
//  Created by Sam Winiarski on 3/7/21.
//

/*
 view is mostly finished for now
 still need to hook up to database
 */

import SwiftUI

struct FollowerView: View {
    
    @State var users: [String] = []
    @State var username: String = ""
    @State var followers: Int = 0
    @State var following: Int = 0
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
                        users = getFollowers()
                    }
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(followers_selected ? .blue : .black)
                    .padding(.top)
                    .frame(maxWidth: .infinity)
                    
                    if followers_selected {
                        Divider()
                            .frame(height: 1)
                            .background(Color.blue)
                    }
                    else {
                        Divider()
                            .hidden()
                    }
                }
                
                VStack {
                    Button("\(following) Following") {
                        followers_selected = false
                        following_selected = true
                        users = getFollowing()
                    }
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(following_selected ? .blue : .black)
                    .padding(.top)
                    .frame(maxWidth: .infinity)
                    
                    if following_selected {
                        Divider()
                            .frame(height: 1)
                            .background(Color.blue)
                    }
                    else {
                        Divider()
                            .hidden()
                    }
                }
                Spacer()
            }
            
            List(users, id: \.self) { follower in
                ZStack {
                    NavigationLink(destination: ProfileView()) {
                        EmptyView()
                    }
                    .hidden()
                    HStack {
                        Text(follower)
                        Spacer()
                    }
                }
            }
            .navigationTitle(username)
            .navigationBarTitleDisplayMode(.inline)
        }
        //displays correct user list based on if followers or following was clicked to get to this view
        .onAppear() {
            if followers_selected {
                users = getFollowers()
            }
            else if following_selected {
                users = getFollowing()
            }
        }
        
    }
}

//function to get list of followers for logged in user
//need to rewrite to access database for this information once it's setup
func getFollowers() -> [String] {
    return ["Luke", "Justin"]
}

//function to get list of following for logged in user
//need to rewrite to access database for this information once it's setup
func getFollowing() -> [String] {
    return ["John Harry", "Aidan"]
}

struct FollowerView_Previews: PreviewProvider {
    static var previews: some View {
        FollowerView()
    }
}
