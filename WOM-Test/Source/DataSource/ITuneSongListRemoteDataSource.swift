//
//  ITuneSongListRemoteDataSource.swift
//  WOM-Test
//
//  Created by Felipe Ugarte on 07-03-24.
//

import Foundation

class ITuneSongListRemoteDataSource {

    private let apiService: APIService

    init(apiService: APIService = APIService()) {
        self.apiService = apiService
    }

    func fetchSongs() async throws -> [Track] {
        let term = "term=Phill Collins"
        let media = "media=music"
        let limit = "limit=200"

        guard let url = URL(string: "\(ItunesURLPathHandler.getURL(for: .ItunesSongsList))?\(term)&\(media)&\(limit)") else { throw URLError(.badURL) }
        let request = URLRequest(url: url)

        let (data, _) = try await apiService.fetch(urlRequest: request)
        let response = try JSONDecoder().decode(APIResponse.self, from: data)
        var uniqueTracks = [Int: Track]()
        for resultItem in response.results {
            if case .track(let track) = resultItem, ["USA", "SWE", "CHL"].contains(track.country ?? "") {
                uniqueTracks[track.trackId] = track
            }
        }
        let filteredTracks = Array(uniqueTracks.values)

        return Array(filteredTracks.prefix(10))
    }
}
