//
//  Reader.swift
//  Bop
//
//  Created by Justin Hurley on 2/21/21.
//

import Foundation

class Reader{
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: "ARTISTS2-21",
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print("File Not Found Error")
        }
        
        return nil
    }
    
    private func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode(ArtistData.self,
                                                       from: jsonData)
            
            print("Title: ", decodedData.name)
            print("Description: ", decodedData.spotifyMonthlyListeners)
            print("===================================")
        } catch {
            print("decode error")
        }
    }
}


