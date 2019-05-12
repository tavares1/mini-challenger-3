//
//  Advert.swift
//  cloudkitmanager
//
//  Created by Mateus Rodrigues on 10/05/19.
//  Copyright © 2019 Mateus Rodrigues. All rights reserved.
//

import Foundation
import CloudKit

public class Advert {

    public private(set) var record: CKRecord
    
    public var id: CKRecord.ID? {
        return record.recordID
    }
    
    public var owner: CKRecord.Reference {
        set {
            record["owner"] = newValue
        }
        get {
            return record["owner"] as! CKRecord.Reference
        }
    }
    
    public var type: AdType {
        set {
            record["type"] = newValue.rawValue
        }
        get {
            return AdType(rawValue: record["type"] as! String)!
        }
    }
    
    public var itemID: String {
        set {
            record["itemID"] = newValue
        }
        get {
            return record["itemID"] as! String
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
    
    public init(owner: CKRecord.Reference, type: AdType, itemID: String, description: String) {
        record = CKRecord(recordType: "Advert")
        self.owner = owner
        self.type = type
        self.itemID = itemID
        self.description = description
    }
    
    public init(record: CKRecord) {
        self.record = record
    }
    
}
