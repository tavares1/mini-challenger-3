//
//  Advert.swift
//  cloudkitmanager
//
//  Created by Mateus Rodrigues on 10/05/19.
//  Copyright © 2019 Mateus Rodrigues. All rights reserved.
//

import Foundation
import CloudKit

class Advert {

    public private(set) var record: CKRecord
    
    public var id: CKRecord.ID? {
        return record.recordID
    }
    
    public var type: AdType {
        set {
            record["type"] = newValue.rawValue
        }
        get {
            return AdType(rawValue: record["type"] as! String)!
        }
    }
    
    public var itemIdentifier: ItemIdentifier {
        set {
            record["itemIdentifier"] = newValue.string
        }
        get {
            return ItemIdentifier(string: record["itemIdentifier"] as! String)
        }
    }
    
    public var description: String {
        set {
            record["description"] = newValue
        }
        get {
            return record["description"] as! String
        }
    }
    
    public init(type: AdType, itemIdentifier: ItemIdentifier, description: String) {
        record = CKRecord(recordType: "Advert")
        self.type = type
        self.itemIdentifier = itemIdentifier
        self.description = description
    }
    
    public init(record: CKRecord) {
        self.record = record
    }
    
}
