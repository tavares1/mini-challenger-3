//
//  CKManagerError.swift
//  cloudkitmanager
//
//  Created by Mateus Rodrigues on 12/05/19.
//  Copyright © 2019 Mateus Rodrigues. All rights reserved.
//

import Foundation
import CloudKit

enum CKManagerError: Error {
    case unknown
    case noAsset(record: CKRecord)
    case invalidFileURL(asset: CKAsset)
    case invalidData
}

extension CKManagerError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unknown:
            return "Unknown error during CloudKit operation."
        case .noAsset(let record):
            return "\(record) has no CKAsset in 'asset' key."
        case .invalidFileURL(let asset):
            return "Invalid fileURL for \(asset)."
        case .invalidData:
            return "Data is not a valid image data."
        }
    }
}
