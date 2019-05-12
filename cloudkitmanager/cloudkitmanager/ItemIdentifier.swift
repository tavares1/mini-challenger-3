//
//  Identifier.swift
//  cloudkitmanager
//
//  Created by Mateus Rodrigues on 10/05/19.
//  Copyright © 2019 Mateus Rodrigues. All rights reserved.
//

import Foundation

// https://www.swiftbysundell.com/posts/type-safe-identifiers-in-swift

struct ItemIdentifier: Hashable {
    let string: String
}

extension ItemIdentifier: ExpressibleByStringLiteral {
    init(stringLiteral value: String) {
        string = value
    }
}

extension ItemIdentifier: CustomStringConvertible {
    var description: String {
        return string
    }
}

extension ItemIdentifier: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        string = try container.decode(String.self)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(string)
    }
}
