//
//  CKManager+Advert.swift
//  cloudkitmanager
//
//  Created by Mateus Rodrigues on 12/05/19.
//  Copyright © 2019 Mateus Rodrigues. All rights reserved.
//

import Foundation
import CloudKit

extension CKManager {
    
    public func save(_ advert: Advert, completion: @escaping (Result<CKRecord, Error>) -> Void) {
        publicDatabase.save(advert.record) { (record, error) in
            guard let record = record else {
                completion(.failure(error ?? CKManagerError.unknown))
                return
            }
            completion(.success(record))
        }
    }
    
    public func fetchAllAdverts(completion: @escaping (Result<[Advert], Error>) -> Void) {
        let query = CKQuery(recordType: "Advert", predicate: NSPredicate(value: true))
        publicDatabase.perform(query, inZoneWith: nil) { (records, error) in
            guard let records = records else {
                completion(.failure(error ?? CKManagerError.unknown))
                return
            }
            let adverts = records.map({ (record) -> Advert in
                return Advert(record: record)
            })
            completion(.success(adverts))
        }
    }
    
    public func fetchAdvertsOf(_ user: User, completion: @escaping (Result<[Advert], Error>) -> Void) {
        guard let id = user.id else {
            completion(.failure(CKManagerError.userWithoutID(user: user)))
            return
        }
        let ref = CKRecord.Reference(recordID: id, action: .none)
        let predicate = NSPredicate(format: "owner = %@", ref)
        let query = CKQuery(recordType: "Advert", predicate: predicate)
        publicDatabase.perform(query, inZoneWith: nil) { (records, error) in
            guard let records = records else {
                completion(.failure(error ?? CKManagerError.unknown))
                return
            }
            let adverts = records.map({ (record) -> Advert in
                return Advert(record: record)
            })
            completion(.success(adverts))
        }
    }
    
}
