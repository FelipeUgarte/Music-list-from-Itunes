//
//  SongDetailView.swift
//  WOM-Test
//
//  Created by Felipe Ugarte on 07-03-24.
//

import SwiftUI

struct SongDetailView: View {
    let track: Track

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Manejo de la imagen de la portada
                let artworkUrl = URL(string: track.artworkUrl100 ?? "")
                AsyncImage(url: artworkUrl) { phase in
                    switch phase {
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 300, maxHeight: 300)
                                .cornerRadius(15)
                                .shadow(radius: 10)
                        case .failure:
                            Image(systemName: "photo")
                                .font(.largeTitle)
                                .foregroundColor(.gray)
                        case .empty:
                            ProgressView()
                        @unknown default:
                            EmptyView()
                    }
                }
                .padding(.bottom, 20)

                Group {
                    Text(track.trackName)
                        .font(.title)
                        .bold()

                    Text("Artist: \(track.artistName)")
                        .font(.title3)
                        .foregroundColor(.secondary)

                    if let albumName = track.collectionName {
                        Text("Album: \(albumName)")
                            .font(.headline)
                    }

                    Text("Genre: \(track.primaryGenreName)")
                        .font(.headline)
                }
                .padding(.bottom, 5)

                // Espacio para agregar más detalles o funciones
            }
            .padding()
        }
        .navigationTitle("Song Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
