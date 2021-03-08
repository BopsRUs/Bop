//
//  ProfileView.swift
//  Bop
//
//  Created by Justin Hurley on 2/17/21.
//

import SwiftUI

var profName = "Justin Hurley"

struct ProfileView: View {
    
//    init() {
//        AuthService.fetchAttributes()
//    }

    var body: some View {
        
        NavigationView {
            
            VStack {
                
                //followers/following stack
                HStack {
                    Spacer()
                    //followers
                    NavigationLink(
                        destination: FollowerView(/*followers_selected: true, following_selected: false*/)) {
                        VStack {
                            Text("420")
                                .font(.system(size: 22))
                            Text("Followers")
                                .padding(.horizontal)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    Spacer()
                    //following
                    NavigationLink(
                        destination: FollowerView(/*followers_selected: false, following_selected: true*/)) {
                        VStack {
                            Text("69")
                                .font(.system(size: 22))
                            Text("Following")
                                .padding(.horizontal)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    Spacer()
                }
                .padding(.top)
                
                Spacer()
                
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
