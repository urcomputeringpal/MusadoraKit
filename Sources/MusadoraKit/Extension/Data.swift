//
//  Data.swift
//  MusadoraKit
//
//  Created by Rudrank Riyam on 14/08/21.
//

import Foundation

extension Data {
  func printJSON() throws -> String {
    let json = try JSONSerialization.jsonObject(with: self, options: [])
    let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)

    guard let jsonString = String(data: data, encoding: .utf8) else {
      throw URLError(.cannotDecodeRawData)
    }
    return jsonString
  }
}
