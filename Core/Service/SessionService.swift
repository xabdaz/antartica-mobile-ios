//
//  SessionService.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 23/10/21.
//

import Foundation
public class SessionService {
    
    private let restClient: BackendRestClient
    init(restClient: BackendRestClient) {
        self.restClient = restClient
    }
}
