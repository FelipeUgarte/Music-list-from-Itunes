//
//  Network.swift
//  WOM-Test
//
//  Created by Felipe Ugarte on 05-03-24.
//

import Foundation

class APIService {
    func fetch(urlRequest: URLRequest) async throws -> (Data, URLResponse) {
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        return (data, response)
    }
}
