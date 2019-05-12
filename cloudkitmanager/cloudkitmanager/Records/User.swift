//
//  User.swift
//  cloudkitmanager
//
//  Created by Mateus Rodrigues on 10/05/19.
//  Copyright © 2019 Mateus Rodrigues. All rights reserved.
//

import Foundation
import CloudKit

public class User {
    
    public private(set) var record: CKRecord
    
    public var id: CKRecord.ID? {
        return record.recordID
    }
    
    public var name: String {
        set {
            record["name"] = newValue
        }
        get {
            return record["name"] as! String
        }
    }
    
    public var token: String {
        set {
            record["token"] = newValue
        }
        get {
            return record["token"] as! String
        }
    }
    
    public var imageRef: CKRecord.Reference? {
        set {
            record["imageRef"] = newValue
        }
        get {
            return record["imageRef"] as? CKRecord.Reference
        }
    }
    
    public init(name: String, token: String, imageRef: CKRecord.Reference) {
        record = CKRecord(recordType: "User")
        self.name = name
        self.token = token
        self.imageRef = imageRef
    }
    
    public init(record: CKRecord) {
        self.record = record
    }
    
}
