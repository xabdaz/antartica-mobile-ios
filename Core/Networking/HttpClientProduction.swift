//
//  HttpClientProduction.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 26/10/21.
//

import Foundation
public protocol HttpClient {
    func set(headers: [String: String])
    func request(resource: String, method: HttpMethod, json: Data?, completion: @escaping (ApiResponse) -> Void)
}

public class HttpClientProduction: HttpClient {
    private var header: [String: String] = [:]
    public func set(headers: [String : String]) {
        self.header = headers
    }
    
    public func request(
        resource: String,
        method: HttpMethod,
        json: Data?, completion: @escaping (ApiResponse) -> Void
    ) {
        guard let url = URL(string: resource) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            guard let `self` = self else { return }
            if error == nil {
                guard let data = data else {
                    return
                }
                self.log(data: data, url: resource)
                let str = String(data: data, encoding: .utf8)
                completion(self.getResponse(200, resource, method, str))
            } else {
                completion(self.getError(404, resource: resource, error: error, method: method))
            }
        }.resume()
    }
    
    private func getResponse(_ code: Int, _ resource: String, _ method: HttpMethod, _ data: String?) -> ApiResponse {
        return ApiResponse(
            success: true,
            statusCode: code,
            requestUrl: resource,
            method: method,
            data: data?.data(using: .utf8),
            error: nil)
    }

    private func getError(_ code: Int, resource: String, error: Error?, method: HttpMethod) -> ApiResponse {
        return ApiResponse(
            success: false,
            statusCode: code,
            requestUrl: resource,
            method: method,
            data: nil,
            error: error
        )
    }

    func log(data: Data, url: String) {
        print("[RESPONSE] -> \(url)")
        guard let object = try? JSONSerialization.jsonObject(with: data, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyString = String(data: data, encoding: .utf8) else {
                  return
              }
        print(prettyString)
    }
}
