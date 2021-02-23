//
//  Codables.swift
//  Bop
//
//  Created by Justin Hurley on 2/21/21.
//

import Foundation

struct ArtistData: Codable {
    let id: Int
    let name: String
    let soundCloudFollowers: Int
    let spotifyListenerFollowerRatio: Float
    let spotifyMonthlyListeners: Int
    let spotifyPopularity: Int
    let youtubeChannelViews: Int
}
