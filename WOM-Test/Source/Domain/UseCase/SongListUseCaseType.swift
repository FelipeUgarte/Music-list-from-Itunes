//
//  SongListUseCaseType.swift
//  WOM-Test
//
//  Created by Felipe Ugarte on 05-03-24.
//

import Foundation

enum ItuneSongListUseCaseType: UseCaseType {
    case getItuneSongList
    case getItuneSongDetail
}

public protocol UseCaseType {}

public protocol UseCase {
    func execute<T>(for useCase: UseCaseType) async throws -> T
}
