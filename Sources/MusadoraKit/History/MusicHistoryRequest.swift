//
//  MusicHistoryRequest.swift
//  MusicHistoryRequest
//
//  Created by Rudrank Riyam on 02/04/22.
//

import Foundation
import MusicKit

/// A  request that your app uses to fetch historical information about
/// the songs and stations the user played recently.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct MusicHistoryRequest {
    /// A limit for the number of items to return
    /// in the history response.
    public var limit: Int?

    public var endpoint: MusicHistoryEndpoints

    /// Creates a request to fetch historical data based on the history endpoint.
    public init(for endpoint: MusicHistoryEndpoints) {
        self.endpoint = endpoint
    }

    public func response() async throws -> MusicHistoryResponse {
        let url = try historyEndpointURL
        let request = MusicDataRequest(urlRequest: .init(url: url))
        let response = try await request.response()
        let items = try JSONDecoder().decode(MusicItemCollection<UserMusicItem>.self, from: response.data)

        return MusicHistoryResponse(items: items)
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension MusicHistoryRequest {
    private var historyEndpointURL: URL {
        get throws {
            var components = URLComponents()
            var queryItems: [URLQueryItem]?

            components.scheme = "https"
            components.host = "api.music.apple.com"
            components.path = "/v1/me/"
            components.path += endpoint.path

            if let limit = limit {
                queryItems = [URLQueryItem(name: "limit", value: "\(limit)")]
            }

            components.queryItems = queryItems

            guard let url = components.url else {
                throw URLError(.badURL)
            }

            return url
        }
    }
}
