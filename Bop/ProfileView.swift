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
        VStack(){
            Button(action: {
                print("Settings Pressed!")
            }){
                Text("Settings")
            }
            NavigationView{
                VStack{
                    ForEach(profileLinkNames, id: \.self)
                    { profileLinkName in
                        Text(profileLinkName)
                            .font(.body)
                    }
                    Spacer()
                }
                    .navigationBarTitle(profName)
            }
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
