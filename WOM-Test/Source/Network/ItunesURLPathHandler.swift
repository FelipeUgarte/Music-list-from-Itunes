//
//  ItunesURLPathHandler.swift
//  WOM-Test
//
//  Created by Felipe Ugarte on 05-03-24.
//

import Foundation

class ItunesURLPathHandler {
    static func getURL(for endpoint: ItunesURLPathHandlerType) -> String {
        switch endpoint {
            case .ItunesSongsList:
                return String(format: "https://itunes.apple.com/search")
            case .ItunesSongsDetail:
                return String(format: "https://itunes.apple.com/search")
        }
    }
}

enum ItunesURLPathHandlerType {
    case ItunesSongsList
    case ItunesSongsDetail

}
