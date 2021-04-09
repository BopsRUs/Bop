//
//  UserManipulation.swift
//  Bop
//
//  Created by Aidan Reid on 3/19/21.
//

import Foundation
import Amplify
import SwiftUI
import Combine

class UserActions{
    var ID: String
    var username: String
    var email: String
    var userStocks: [Stocks] = []
    var followers: [String] = []
    var following: [String] = []
    var blocked: [String] = []
    var muted: [String] = []
    var privacy: String = "Very"
    var posts: [Post] = []
    var profilePic: Data?
    
    func getUserStocks(){
        Amplify.DataStore.query(Stocks.self, where: Stocks.keys.userID == ID ){
            switch $0 {
            case .success(let result):
                for stock in result{
                    userStocks.append(stock)
                }
                
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    func getUserPosts(){
        Amplify.DataStore.query(Post.self, where: Post.keys.userID == ID ){
            switch $0 {
            case .success(let result):
                for stock in result{
                    posts.append(stock)
                }
                
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    func checkProfile(){
        _ = Amplify.DataStore.clear()
        Amplify.DataStore.query(User.self, byId: ID){
        switch $0 {
        case .success(let result):
            if result == nil{
                
                break
            }
            self.followers=result?.followers ?? []
            self.following=result?.following ?? []
            self.blocked=result?.blocked ?? []
            self.muted=result?.muted ?? []
            self.privacy=result?.privacy ?? "Very"
            print(result as Any)
            break
            
        case .failure(let error):
            print("ERROR", error)
            _ = Amplify.DataStore.save(User(id: ID, name: username, privacy: "Very", email: self.email))
                }
        }
    }
    
    func updateUserProfile(){
        let newUser = User(id: ID, name: username, privacy: self.privacy,followers: self.followers, following: self.following, blocked: self.blocked, muted: self.muted, email: self.email )
        _ = Amplify.DataStore.save(newUser){
            switch $0 {
            case .success(let result):
                print("HEYYYYYYY", result)
                
            case .failure(let error):
                print(error)
                break
            }
        }

    }

    
    init(id: String, user: String, email: String){
        ID = id
        username = user
        self.email = email
        checkProfile()
        getUserStocks()
        getUserPosts()

    }


    


            
    func mutateUserPost(id: String = UUID().uuidString, title: String, text: String, like: Double = 0){
        let newPost = Post(id: id, title: title, userID: ID, content: text, likes: like)
        _ = Amplify.DataStore.save(newPost)
    }
    
    func deleteUserPost(id: String){
        _ = Amplify.DataStore.delete(Post.self, withId: id)
    }
    
    func mutateUserStocks(id: String = UUID().uuidString, title: String, quantity: String, artistID: String){
        let newStock = Stocks(id: id, title: title, quantity: quantity, userID: ID, artistID: artistID)
        _ = Amplify.DataStore.save(newStock)
    }
    
    func deleteUserStocks(id: String){
        _ = Amplify.DataStore.delete(Stocks.self, withId: id)
    }
    
    func uploadProfilePic(_ image: UIImage){
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return}
        let key = "U" + ID
        
        _ = Amplify.Storage.uploadData(key: key, data: imageData){
            switch $0 {
            case .success(let result):
                print("Successful upload")
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func downloadProfilePic(){
        Amplify.Storage.downloadData(
            key: "U" + ID,
            progressListener: { progress in
                print("Progress: \(progress)")
            }, resultListener: { (event) in
                switch event {
                case let .success(data):
                    print("Completed: \(data)")
                    self.profilePic=data
                case let .failure(storageError):
                    print("Failed: \(storageError.errorDescription). \(storageError.recoverySuggestion)")
            }
        })
    }
    
}
