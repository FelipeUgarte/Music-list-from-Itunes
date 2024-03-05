//
//  SongListUseCase.swift
//  WOM-Test
//
//  Created by Felipe Ugarte on 05-03-24.
//

import Foundation

//class ItuneSongListUseCase: UseCase {
//    private let iTunesAPIRepository: ITunesAPIRepository
//    
//    init(iTunesAPIRepository: ITunesAPIRepository) {
//        self.iTunesAPIRepository = iTunesAPIRepository
//    }
//    
//    func execute<T>(for useCase: UseCaseType) async throws -> T {
//        guard let ituneSongListUseCase = useCase as? ItuneSongListUseCaseType else { throw  }
//        switch ituneSongListUseCase {
//            case .getItuneSongList:
//                let iTunesSongListResultItem: ResultItem = try await getITunesSongListResultItem()
//                return iTunesSongListResultItem as! T
//            case .getItuneSongDetail: //Modificar para el song detail
//                let iTunesSongListResultItem: ResultItem = try await getITunesSongListResultItem()
//                return iTunesSongListResultItem as! T
//        }
//    }
//    
//    private func getITunesSongListResultItem() async throws -> ResultItem {
//        let itunesSongList = try await iTunesAPIRepository.getItuneSongListRemoteDataSource { <#[Track]?#> in
//            <#code#>
//        }
//        let uuid = cancellationTripPreview.uuid
//        if cancellationTripPreview.isUuidMissingAndError() {
//            cancelTripPreviewNillUUIDEventLog(eventType: .domainError, reservationId: reservationID)
//        }
//        self.uuid = uuid
//        return cancellationTripPreview
//    }
//}
