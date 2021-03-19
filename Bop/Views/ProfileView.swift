//
//  ProfileView.swift
//  Bop
//
//  Created by Justin Hurley on 2/17/21.
//

import SwiftUI

//let usersList = ["Sam", "Justin", "Luke", "JH", "Aidan"]

struct ProfileView: View {
    
    @State var username: String = "sam_winiarski"
    @State var followers: Int = 420
    @State var following: Int = 69
    @State var transactions: [String] = ["Bought 12 shares of Drake", "Sold 25 shares of Eminem"]

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
                        destination: FollowerView(users: ["Justin", "Luke", "John Harry", "Aidan"], username: "sam_winiarski", followers: followers, following: following, followers_selected: true, following_selected: false)) {
                        //destination: FollowerView(username: "sam")) {
//                        destination: FollowerView(followers_selected: true, following_selected: false)) {
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
                        //destination: FollowerView())
//                        destination: FollowerView(username: "sam")) {
                        destination: FollowerView(users:["Justin", "Luke", "John Harry", "Aidan"], username: "sam_winiarski", followers: followers, following: following, followers_selected: false, following_selected: true)) {
//                        destination: FollowerView(followers_selected: false, following_selected: true)) {
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
