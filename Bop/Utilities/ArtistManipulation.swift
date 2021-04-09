//
//  ArtistManipulation.swift
//  Bop
//
//  Created by Aidan Reid on 3/29/21.
//

import Foundation
import Amplify

class ArtistActions{
    
    var name: String = ""
    var id: String = ""
    var value: Double = 0
    
    func getArtistByName(artistName: String){
        Amplify.DataStore.query(Artist.self, where: Artist.keys.name == artistName ){
            switch $0 {
            case .success(let result):
                let res = result[0]
                name = res.name
                id = res.id
                value = res.value
                
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    func getArtistByID(artistID: String){
        Amplify.DataStore.query(Artist.self, byId: artistID ){
            switch $0 {
            case .success(let result):
                if result != nil{
                    let res = result
                    name = res?.name ?? ""
                    id = artistID
                    value = res?.value ?? 0
                }
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}
