//
//  SettingsView.swift
//  Bop
//
//  Created by Justin Hurley on 2/19/21.
//

import SwiftUI
import Amplify

struct SettingsView: View {
    
    @State var name: String = "Sam Winiarski"
    @State var username: String = ""
    @State var email: String = "myemail@email.com"
    
    init() {
        if let user = Amplify.Auth.getCurrentUser() {
            _username = State(initialValue: user.username)
            //set email here
        }
    }
    
    var body: some View {
        List {
            Section(header: Text("My Account")) {
                NavigationLink(destination: self) {
                    Text("Name")
                }
                NavigationLink(destination: EditUsernameView()) {
                    HStack {
                        Text("Username")
                        Spacer()
                        Text(username)
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                }
                NavigationLink(destination: self) {
                    HStack {
                        Text("Email")
                        Spacer()
                        Text(email)
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                }
                NavigationLink(destination: self) {
                    Text("Password")
                }
                NavigationLink(destination: self) {
                    Text("Notifications")
                }
                Button("Log Out") {
                    Amplify.Auth.signOut()
                }
                .buttonStyle(PlainButtonStyle())
//                NavigationLink(destination: LogInView()) {
//                    Button("Log Out") {
//                        Amplify.Auth.signOut()
//                    }
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .buttonStyle(PlainButtonStyle())
//                }
//                .navigationBarBackButtonHidden(true)
//                ZStack {
//                    HStack {
//                        Button("Log Out") {
//                            Amplify.Auth.signOut() { result in
//                                print("\n\n\nloggning out")
//                                switch(result) {
//                                case .success:
//                                    print("log out successful")
//                                    break
//                                case .failure:
//                                    print("log out failed")
//                                    break
//                                }
//                            }
//                        }
//                        .buttonStyle(PlainButtonStyle())
//                        Spacer()
//                    }
//
//                    NavigationLink(destination: LogInView()) {
//                        EmptyView()
//                    }
//                }
            }
            
            Section(header: Text("Who Can...")) {
                NavigationLink(destination: self) {
                    Text("View My Portfolio")
                }
            }
            
            Section(header: Text("Connections")) {
                NavigationLink(destination: self) {
                    Text("Blocked Accounts")
                }
                NavigationLink(destination: self) {
                    Text("Muted Accounts")
                }
            }
            
            Section(header: Text("Feedback")) {
                NavigationLink(destination: self) {
                    Text("Report Bug")
                }
                NavigationLink(destination: self) {
                    Text("Artist Suggestion")
                }
            }
            
        }
        .listStyle(GroupedListStyle())
        .navigationTitle(Text("Settings"))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
