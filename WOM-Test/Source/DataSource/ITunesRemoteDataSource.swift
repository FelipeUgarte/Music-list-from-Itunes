//
//  ItuneRemoteDataSource.swift
//  WOM-Test
//
//  Created by Felipe Ugarte on 05-03-24.
//

import Foundation

class ITuneSongListRemoteDataSource {
    
    private let apiService: APIService
    
    init(apiService: APIService = APIService()) {
        self.apiService = apiService
    }
    
    func fetchSongs() async throws -> [Track] {
        let endpointURLString = ItunesURLPathHandler.getURL(for: .ItunesSongsList)
        guard var urlComponents = URLComponents(string: endpointURLString),
              let url = urlComponents.url else {
            throw URLError(.badURL)
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "term", value: "music"),
            URLQueryItem(name: "media", value: "music"),
            URLQueryItem(name: "limit", value: "200")
        ]
        
        let request = URLRequest(url: url)
        
        let (data, _) = try await apiService.fetch(urlRequest: request)
        let response = try JSONDecoder().decode(APIResponse.self, from: data)
        let tracks = response.results.compactMap { resultItem -> Track? in
            if case .track(let track) = resultItem, let country = track.country, ["USA", "SWE", "CHL"].contains(country) {
                return track
            } else {
                return nil
            }
        }
        return tracks
    }
}
