//
//  BackendRestClient.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 26/10/21.
//

import Foundation
import RxSwift
import RxCocoa

public class BackendRestClient {
    private let httpClient: HttpClient
    
    public init(httpClient: HttpClient) {
        self.httpClient = httpClient
    }
    
    func request<T: Codable>(_ request: ApiRequest<T>) -> Single<T>{
        return Single.create { [weak self] single in
            guard let self = self else { return Disposables.create() }
            self.httpClient.set(headers: request.header)
            let resource: String = "https://jsonplaceholder.typicode.com\(request.resource)"
            self.httpClient.request(
                resource: resource,
                method: request.method,
                json: request.json)
            {
                self.validate(
                    useSZModel: request.useSZModel,
                    response: $0,
                    for: request,
                    single: single
                )
            }
            
            return Disposables.create()
        }
    }
    
    private func validate<T: Codable>(useSZModel: Bool, response: ApiResponse, for request: ApiRequest<T>, single: Single<T>.SingleObserver) {
        
        guard response.success && response.statusCode == request.expectedCode else {
            let error = ApiError.requestFailed(statusCode: response.statusCode, response: response.data)
            single(.error(error))
            return
        }
        
        if useSZModel {
            guard
                let baseResponse = response.data?.toObject(type: SZModel<T>.self),
                let parsedResponse = baseResponse.data else {
                let error = ApiError.requestFailed(statusCode: response.statusCode, response: response.data)
                single(.error(error))
                return
            }
            single(.success(parsedResponse))
        } else {
            guard let parsedResponse = response.data?.toObject(T.self) else {
                let error = ApiError.requestFailed(statusCode: response.statusCode, response: response.data)
                single(.error(error))
                return
            }

            single(.success(parsedResponse))
        }
    }
}
