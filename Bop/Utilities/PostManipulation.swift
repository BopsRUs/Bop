//
//  PostManipulation.swift
//  Bop
//
//  Created by Aidan Reid on 4/9/21.
//

import Foundation
import Amplify
import SwiftUI
import Combine

class PostActions{
    
    var ID: String
    var title: String = " "
    var userID: String = " "
    var content: String = " "
    var likes: Double = 0
    var postComments: [Comment] = []

    init(id: String){
        ID = id
        checkPost()
    }
    
    
    func checkPost(){
        Amplify.DataStore.query(Post.self, byId: ID){
        switch $0 {
        case .success(let result):
            if result == nil{
                
                break
            }
            title=result?.title ?? " "
            userID=result?.userID ?? " "
            content=result?.content ?? " "
            likes=result?.likes ?? 0
            break
            
        case .failure(let error):
            print("ERROR", error)
        }}}
        
    func updatePost(){
        let newPost = Post(id: ID, title: self.title, userID: self.userID,content: self.content, likes: self.likes)
            Amplify.DataStore.save(newPost){
                switch $0 {
                case .success(let result):
                    print("HEYYYYYYY", result)
                    
                case .failure(let error):
                    print(error)
                    break
                }
            }

        }

    func getPostComments(){
        Amplify.DataStore.query(Comment.self, where: Comment.keys.postID == ID ){
            switch $0 {
            case .success(let result):
                for stock in result{
                    postComments.append(stock)
                }
                
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    func mutatePostComments(id: String = UUID().uuidString, content: String, username: String){
        let newComment = Comment(id: id, postID: ID, content: content, username: username, userID: userID)
        _ = Amplify.DataStore.save(newComment)
    }

    func deletePostComments(id: String){
        _ = Amplify.DataStore.delete(Comment.self, withId: id)
    }


}
