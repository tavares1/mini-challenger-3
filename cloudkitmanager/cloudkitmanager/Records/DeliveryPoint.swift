//
//  DeliveryPoint.swift
//  cloudkitmanager
//
//  Created by Mateus Rodrigues on 10/05/19.
//  Copyright © 2019 Mateus Rodrigues. All rights reserved.
//

import Foundation
import CloudKit
import CoreLocation

public class DeliveryPoint {
    
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
    
    public var location: CLLocation {
        set {
            record["location"] = newValue
        }
        get {
            return record["location"] as! CLLocation
        }
    }
    
    public init(name: String, location: CLLocation) {
        record = CKRecord(recordType: "DeliveryPoint")
        self.name = name
        self.location = location
    }
    
    public init(record: CKRecord) {
        self.record = record
    }
    
}
