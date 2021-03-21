//
//  ProfileView.swift
//  Bop
//
//  Created by Justin Hurley on 2/17/21.
//

import SwiftUI
import Amplify

struct ProfileView: View {
    
    @State var username: String = ""
    @State var followers: Int = 420
    @State var following: Int = 69
    @State var transactions: [String] = ["Bought 12 shares of Drake", "Sold 25 shares of The Weeknd"]
    
    init() {
        if let user = Amplify.Auth.getCurrentUser() {
            _username = State(initialValue: user.username)
        }
    }

    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Image(systemName: "smiley")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.top)
                
                Text(username)
                    .font(.system(size: 26))
                    .padding(.bottom)
                
                //followers and following stack
                HStack {
                    Spacer()
                    //followers
                    NavigationLink(
                        destination: FollowerView(username: username, followers: followers, following: following, followers_selected: true, following_selected: false)) {
                        VStack {
                            Text(String(followers))
                                .font(.system(size: 22))
                            Text("Followers")
                                .padding(.horizontal)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    
                    //following
                    NavigationLink(
                        destination: FollowerView(username: username, followers: followers, following: following, followers_selected: false, following_selected: true)) {
                        VStack {
                            Text(String(following))
                                .font(.system(size: 22))
                            Text("Following")
                                .padding(.horizontal)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    Spacer()
                }
                .padding(.top)
                .padding(.bottom, 25)
                                
                Section(header: Text("Recent Activity"), content: {
                    List(transactions, id: \.self) { transaction in
                        Text(transaction)
                    }
                    .listStyle(PlainListStyle())
                })
                
            }
            .navigationBarTitle("Profile")
            .navigationBarItems(trailing: NavigationLink(destination: SettingsView()) {
                Image(systemName: "gear")
                    .resizable()
                    .frame(width: 30, height: 30)
                    
            })
        }
        .padding(.horizontal)
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
