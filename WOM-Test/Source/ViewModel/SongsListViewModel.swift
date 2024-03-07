//
//  SongsListView.swift
//  WOM-Test
//
//  Created by Felipe Ugarte on 07-03-24.
//

import Foundation

@MainActor
class SongsListViewModel: ObservableObject {

    @Published var tracks: [Track] = []
    @Published var isLoading = false
    @Published var showingError = false
    @Published var errorMessage: String?

    private let repository: ITunesAPIRepository

    init(repository: ITunesAPIRepository = ITunesAPIRepository()) {
        self.repository = repository
    }

    func loadSongs() async {
        isLoading = true
        errorMessage = nil
        do {
            let songs = try await repository.getItuneSongListRemoteDataSource()
            tracks = songs
            self.showingError = false // no necesariamente acá
        } catch {
            self.showingError = true
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
