//
//  Day6.swift
//  iOS
//
//  Created by UMPUSTEN on 06.12.20.
//

import Foundation

let input = inputDay6.trimmingCharacters(in: .whitespacesAndNewlines)
    .components(separatedBy: "\n\n")

print(
    input.map { $0.replacingOccurrences(of: "\n", with: "") }
        .map { Set($0) }.reduce("",+).count
)

print(
    input.map { $0.components(separatedBy: "\n") }
        .map { group in
        group.map { Set($0) }
            .reduce(Set("abcdefghijklmnopqrstuvwxyz")) { $0.intersection($1)
            }.count
    }.reduce(0,+)
)
//
//  print(
//      input.map { $0.components(separatedBy: "\n") }
//          .map { group in
//              group.map { Set($0) }.flatMap { $0 }
//          }.map { allAnsers in
//              Dictionary(grouping: allAnsers, by: { $0 })
//                  .filter { $1.count > 1 } // should be > then group count
//                  .keys
//                  .count
//          }.reduce(0,+)
//  )
//
