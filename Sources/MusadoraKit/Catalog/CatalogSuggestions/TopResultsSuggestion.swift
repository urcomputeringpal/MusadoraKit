//
//  TopResultsSuggestion.swift
//  MusadoraKit
//
//  Created by Rudrank Riyam on 23/04/22.
//

import Foundation

/// A suggested popular result for similar search prefix terms.
@available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 9.0, *)
public struct TopResultsSuggestion: Codable, Equatable, Hashable {
  /// The kind of suggestion.
  /// Value: topResults
  public let kind: SuggestionsKind

  /// The actual resource for the suggested content.
  /// Possible types: Albums, RadioShows, Artists, Curators, MusicVideos, Playlists, RecordLabels, Songs, Stations.
  public let content: SearchSuggestionItem
}
