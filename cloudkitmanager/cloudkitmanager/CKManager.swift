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
    
    public static let shared = CKManager()
    
    public private(set) var container = CKContainer(identifier: "iCloud.academy.mateusrodrigues.CloudKitTest")
    
    internal lazy var publicDatabase = self.container.publicCloudDatabase
    
    private init() { }
    
    public func iCloudUserID(completion: @escaping (Result<String, Error>) -> Void) {
        container.fetchUserRecordID { recordID, error in
            guard let recordID = recordID else {
                completion(.failure(error ?? CKManagerError.unknown))
                return
            }
            completion(.success(recordID.recordName))
        }
    }
    
}
