//
//  ApiRequest.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 26/10/21.
//

import Foundation
import Foundation
open class ApiRequest<T: Codable> {
    public let method: HttpMethod
    public let resource: String
    public let expectedCode: Int
    public let form: [String: String]?
    public let json: Data?
    public let header: [String: String]
    public let useSZModel: Bool
    public init(
        resource: String,
        method: HttpMethod = .get,
        expectedCode: Int = 200,
        form: [String:String]? = nil,
        json: Data? = nil,
        header: [String: String] = [:],
        useSZModel: Bool = true
    ) {
        self.resource = resource
        self.method = method
        self.expectedCode = expectedCode
        self.form = form
        self.json = json
        self.header = header
        self.useSZModel = useSZModel
    }
}
