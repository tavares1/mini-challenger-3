//
//  CKManager.swift
//  cloudkitmanager
//
//  Created by Mateus Rodrigues on 09/05/19.
//  Copyright © 2019 Mateus Rodrigues. All rights reserved.
//

import Foundation
import UIKit
import CloudKit

public final class CKManager {
    
    enum CKError: Error {
        case unknown
    }
    
    public static let shared = CKManager()
    
    public private(set) var container = CKContainer(identifier: "iCloud.academy.mateusrodrigues.CloudKitTest")
    
    private lazy var publicDatabase = self.container.publicCloudDatabase
    
    private init() { }
    
    func iCloudUserID(completion: @escaping (Result<String, Error>) -> Void) {
        container.fetchUserRecordID { recordID, error in
            guard let recordID = recordID else {
                completion(.failure(error ?? NSError()))
                return
            }
            completion(.success(recordID.recordName))
        }
    }
    
    public func save(_ user: User, completion: @escaping (Result<CKRecord, Error>) -> Void) {
        publicDatabase.save(user.record) { (record, error) in
            guard let record = record else {
                completion(.failure(error ?? NSError()))
                return
            }
            completion(.success(record))
        }
    }
    
    func fetchAllUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        let query = CKQuery(recordType: "User", predicate: NSPredicate(value: true))
        publicDatabase.perform(query, inZoneWith: nil) { (records, error) in
            guard let records = records else {
                completion(.failure(error ?? NSError()))
                return
            }
            let users = records.map({ (record) -> User in
                return User(record: record)
            })
            completion(.success(users))
        }
    }
    
    public func fetchUser(by token: String, completion: @escaping (Result<User, Error>) -> Void) {
        let predicate = NSPredicate(format: "token = %@", token)
        let query = CKQuery(recordType: "User", predicate: predicate)
        publicDatabase.perform(query, inZoneWith: nil) { (records, error) in
            guard let record = records?.first else {
                completion(.failure(error ?? NSError()))
                return
            }
            let user = User(record: record)
            completion(.success(user))
        }
    }
    
    func save(_ image: UIImage, completion: @escaping (Result<CKRecord, Error>) -> Void) {
        let record = CKRecord(recordType: "Image")
        if let data = image.pngData() {
            let url = NSURL.fileURL(withPath: NSTemporaryDirectory()).appendingPathComponent(NSUUID().uuidString+".png")
            do {
                try data.write(to: url)
                record["asset"] = CKAsset(fileURL: url)
                publicDatabase.save(record) { (record, error) in
                    guard let record = record else {
                        completion(.failure(error ?? NSError()))
                        return
                    }
                    completion(.success(record))
                }
                
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func fetchImage(by reference: CKRecord.Reference, completion: @escaping (Result<UIImage?, Error>) -> Void) {
        publicDatabase.fetch(withRecordID: reference.recordID) { (record, error) in
            var image: UIImage?
            guard let record = record else {
                completion(.failure(error ?? NSError()))
                return
            }
            if let asset = record["asset"] as? CKAsset, let fileURL = asset.fileURL {
                do {
                    let data = try Data(contentsOf: fileURL)
                    image = UIImage(data: data)!
                } catch {
                    completion(.failure(error))
                }
            }
            completion(.success(image))
        }
    }
    
}
