//
//  SongModel.swift
//  WOM-Test
//
//  Created by Felipe Ugarte on 05-03-24.
//

import Foundation

struct APIResponse: Codable {
    let resultCount: Int
    let results: [ResultItem]
}

enum ResultItem: Codable {
    case artist(Artist)
    case track(Track)
    
    enum CodingKeys: String, CodingKey {
        case wrapperType
    }
    
    enum WrapperType: String, Decodable {
        case artist = "artist"
        case track = "track"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let wrapperType = try container.decode(WrapperType.self, forKey: .wrapperType)
        
        switch wrapperType {
        case .artist:
            let artist = try Artist(from: decoder)
            self = .artist(artist)
        case .track:
            let track = try Track(from: decoder)
            self = .track(track)
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .artist(let artist):
            try container.encode(WrapperType.artist.rawValue, forKey: .wrapperType)
            try artist.encode(to: encoder)
        case .track(let track):
            try container.encode(WrapperType.track.rawValue, forKey: .wrapperType)
            try track.encode(to: encoder)
        }
    }
}

struct Artist: Codable {
    let artistType: String
    let artistName: String
    let artistLinkUrl: String
    let artistId: Int
    let amgArtistId: Int?
    let primaryGenreName: String
    let primaryGenreId: Int
}

struct Track: Codable {
    let kind: String
    let artistId: Int
    let collectionId: Int?
    let trackId: Int
    let artistName: String
    let collectionName: String?
    let trackName: String
    let collectionCensoredName: String?
    let trackCensoredName: String
    let collectionArtistId: Int?
    let collectionArtistName: String?
    let artistViewUrl: String?
    let collectionViewUrl: String?
    let trackViewUrl: String?
    let previewUrl: String
    let artworkUrl30: String?
    let artworkUrl60: String?
    let artworkUrl100: String?
    let releaseDate: String
    let collectionExplicitness: String?
    let trackExplicitness: String?
    let discCount: Int?
    let discNumber: Int?
    let trackCount: Int?
    let trackNumber: Int?
    let trackTimeMillis: Int?
    let country: String?
    let currency: String?
    let primaryGenreName: String
    let isStreamable: Bool?
}
