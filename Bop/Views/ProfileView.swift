//
//  ProfileView.swift
//  Bop
//
//  Created by Justin Hurley on 2/17/21.
//

import SwiftUI

var profName = "Justin Hurley"
struct ProfileView: View {
    let profileLinkNames: [String] =
    ["Followers", "Following"]
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Spacer()
                    NavigationLink(
                        destination: SettingsView()){
                        Text("Settings")
                    }
                }
                HStack{
                    Text("Followers")
                        .padding(.horizontal)
                    Text("Following")
                        .padding(.horizontal)
                }
                Spacer()
            }
            .navigationBarTitle("Profile")
        }
        .padding(.horizontal)
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
