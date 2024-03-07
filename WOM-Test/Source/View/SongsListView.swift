//
//  ContentView.swift
//  WOM-Test
//
//  Created by Felipe Ugarte on 05-03-24.
//

import SwiftUI


struct SongsListView: View {

    @StateObject private var viewModel = SongsListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.tracks, id: \.trackId) { track in
                NavigationLink {
                    SongDetailView(track: track)
                } label: {
                    HStack {
                        Text(track.trackName)
                            .font(.headline)
                        Spacer()
                        Text(track.artistName)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .refreshable {
                await viewModel.loadSongs()
            }
            .navigationTitle("Songs")
            .overlay {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                }
            }
            .alert("Error", isPresented: $viewModel.showingError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(viewModel.errorMessage ?? "Unknown error")
            }
        }
        .onAppear() {
            Task {
                await viewModel.loadSongs()
            }
        }
    }
}

#Preview {
    SongsListView()
}
