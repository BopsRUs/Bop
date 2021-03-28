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
    var userStocks: [Stocks] = []
    var privacy: String = "Very"
    
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
    
    func checkProfile(){
        Amplify.DataStore.query(User.self, byId: ID){
        switch $0 {
        case .success(let result):
            print(result as Any)
            break
            
        case .failure(let error):
            print("ERROR", error)
            _ = Amplify.DataStore.save(User(id: ID, name: username, privacy: "Very"))
                }
        }
    }
    func getUserPrivacy(){
        Amplify.DataStore.query(User.self, byId: ID){
            switch $0 {
            case .success(let result):
                print("Privacy", result?.privacy)
                privacy=result?.privacy ?? "Very"
                break
                
            case .failure(let error):
                print("ERROR", error)
            }
        }
        
    }
    
    init(id: String, user: String){
        ID = id
        username = user
        checkProfile()
        getUserStocks()
        getUserPrivacy()
    }

    func setUserPrivacy(newPrivacy: String){
        let newUser = User(id: ID, name: username, privacy: newPrivacy)
        _ = Amplify.DataStore.save(newUser)
    }
    


            

    func mutateUserStocks(id: String = UUID().uuidString, title: String, quantity: String){
        let newStock = Stocks(id: id, title: title, quantity: quantity, userID: ID)
        _ = Amplify.DataStore.save(newStock)
    }
    
    func deleteUserStocks(id: String){
        _ = Amplify.DataStore.delete(Stocks.self, withId: id)
    }

    
}
