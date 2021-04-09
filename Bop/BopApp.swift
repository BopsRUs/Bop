//
//  BopApp.swift
//  Bop
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
        
        let accountData = auth.fetchUserInfo()
        let user = UserActions(id: accountData.id, user: accountData.username, email: accountData.email)
        user.mutateUserPost( title: "Boyz II Men Are The Greatest", text: "No explanation necessary", like: 69)
        user.getUserPosts()
        print("Posts", user.posts)
        let post = PostActions(id: user.posts[0].id)
        post.mutatePostComments( content: "I wholeheartedly agree!", username: "Aidan")
        post.getPostComments()
        print("Comments", post.postComments)

        
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
        try Amplify.add(plugin: AWSAPIPlugin())
        try Amplify.add(plugin: AWSCognitoAuthPlugin())
        try Amplify.add(plugin: AWSS3StoragePlugin())
        try Amplify.configure()
        print("Initialized Amplify");
    } catch {
        print("Could not initialize Amplify: \(error)")
    }
}
