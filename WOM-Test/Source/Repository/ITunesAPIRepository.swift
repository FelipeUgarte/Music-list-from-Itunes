//
//  iTunesAPIRepository.swift
//  WOM-Test
//
//  Created by Felipe Ugarte on 05-03-24.
//

import Foundation

class ITunesAPIRepository {
    private let iTuneSongListRemoteDataSource: ITuneSongListRemoteDataSource

    init(iTuneSongListRemoteDataSource: ITuneSongListRemoteDataSource = ITuneSongListRemoteDataSource()) {
        self.iTuneSongListRemoteDataSource = iTuneSongListRemoteDataSource
    }

    func getItuneSongListRemoteDataSource() async throws -> [Track] {
        do {
            let tracks = try await iTuneSongListRemoteDataSource.fetchSongs()
            return tracks
        } catch {
            throw error
        }
    }
}
