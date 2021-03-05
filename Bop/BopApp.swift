//
//  BopApp.swift
//  Bop
//GraphQL endpoint: https://ti2wldlcjvevliigl7izfirj74.appsync-api.us-east-1.amazonaws.com/graphql
//GraphQL API KEY: da2-a7nfp7ayp5bftkcrymctjhq7nu
//  Created by Justin Hurley on 1/25/21.
//
import Amplify
import AmplifyPlugins
import SwiftUI

@main
struct BopApp: App {
    
    @ObservedObject var auth = AuthService()
    
    public init() {
        configureAmplify()
        auth.checkSessionStatus()
        auth.observeAuthEvents()
    }
    var body: some Scene {
        WindowGroup {
            if auth.isSignedIn {
                MainView()
                    .environmentObject(auth)
            } else {
                LogInView()
                    .environmentObject(auth)
            }

        }
    }
}


func configureAmplify() {
    let models = AmplifyModels()
    let apiPlugin = AWSAPIPlugin(modelRegistration: models)
    let dataStorePlugin = AWSDataStorePlugin(modelRegistration: models)
    do {
        try Amplify.add(plugin: apiPlugin)
        try Amplify.add(plugin: dataStorePlugin)
        try Amplify.add(plugin: AWSCognitoAuthPlugin())
        
        try Amplify.configure()
        print("Initialized Amplify");
    } catch {
        print("Could not initialize Amplify: \(error)")
    }
}
