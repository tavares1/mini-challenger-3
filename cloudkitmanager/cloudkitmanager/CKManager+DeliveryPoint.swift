//
//  CKManager+DeliveryPoint.swift
//  cloudkitmanager
//
//  Created by Mateus Rodrigues on 12/05/19.
//  Copyright © 2019 Mateus Rodrigues. All rights reserved.
//

import Foundation
import CloudKit

extension CKManager {
    
    public func save(_ deliveryPoint: DeliveryPoint, completion: @escaping (Result<CKRecord, Error>) -> Void) {
        publicDatabase.save(deliveryPoint.record) { (record, error) in
            guard let record = record else {
                completion(.failure(error ?? CKManagerError.unknown))
                return
            }
            completion(.success(record))
        }
    }
    
    public func fetchAllDeliveryPoints(completion: @escaping (Result<[DeliveryPoint], Error>) -> Void) {
        let query = CKQuery(recordType: "Delivery Point", predicate: NSPredicate(value: true))
        publicDatabase.perform(query, inZoneWith: nil) { (records, error) in
            guard let records = records else {
                completion(.failure(error ?? CKManagerError.unknown))
                return
            }
            let points = records.map({ (record) -> DeliveryPoint in
                return DeliveryPoint(record: record)
            })
            completion(.success(points))
        }
    }
    
}
