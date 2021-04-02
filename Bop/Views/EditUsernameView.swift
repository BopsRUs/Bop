//
//  EditUsernameView.swift
//  Bop
//
//  Created by Sam Winiarski on 3/20/21.
//

import SwiftUI
import Amplify

struct EditUsernameView: View {
    
    @State var username: String = ""
    
    init() {
        if let user = Amplify.Auth.getCurrentUser() {
            _username = State(initialValue: user.username)
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Your Username:")
                    .fontWeight(.bold)
                //not currently working
                TextField("Enter Username...", text: $username, onCommit: {
                    Amplify.Auth.update(userAttribute: AuthUserAttribute(.preferredUsername, value: username)) { result in
                        print(result)
                    }
                })
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal)
            Spacer()
            Spacer()
        }
    }
}

struct EditUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        EditUsernameView()
    }
}
