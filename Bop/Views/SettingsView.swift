//
//  SettingsView.swift
//  Bop
//
//  Created by Justin Hurley on 2/19/21.
//

import SwiftUI
import Amplify

struct SettingsView: View {
    var body: some View {
        NavigationView {
            
            VStack {
                List {
                    Section(header: Text("My Account")) {
//                        NavigationLink(destination: SettingsView()) {
//                            Text("Edit Profile")
//                        }
                        NavigationLink(destination: SettingsView()) {
                            Text("Name")
                        }
                        NavigationLink(destination: SettingsView()) {
                            Text("Username")
                        }
                        NavigationLink(destination: SettingsView()) {
                            Text("Email")
                        }
                        NavigationLink(destination: SettingsView()) {
                            Text("Password")
                        }
                        NavigationLink(destination: SettingsView()) {
                            Text("Notifications")
                        }
                        Button("Log Out") {
                            Amplify.Auth.signOut()
                        }
//                        ZStack {
//                            NavigationLink(destination: SettingsView()) {
//                                EmptyView()
//                            }
//                            Button("Log Out") {
//                                Amplify.Auth.signOut()
//                            }
//                        }
                    }
                    Section(header: Text("Who Can...")) {
                        NavigationLink(destination: SettingsView()) {
                            Text("View My Portfolio")
                        }
                    }
                    Section(header: Text("Connections")) {
                        NavigationLink(destination: SettingsView()) {
                            Text("Blocked Accounts")
                        }
                        NavigationLink(destination: SettingsView()) {
                            Text("Muted Accounts")
                        }
                    }
                    Section(header: Text("Feedback")) {
                        NavigationLink(destination: SettingsView()) {
                            Text("Report Bug")
                        }
                        NavigationLink(destination: SettingsView()) {
                            Text("Artist Suggestion")
                        }
                    }
                    
//                    .padding(.top)
                }
//                .padding(.top)
            }
            
            .navigationTitle(Text("Settings"))
        }
//        .padding(.horizontal)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
