//
//  RestAPIHelper.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 18/05/22.
//

import Foundation

protocol DecodableDataLoader {}

extension DecodableDataLoader {
    func loadDecodableData<T: Decodable>(url: String, networkManager: NetworkRequestManagerProtocol, completion: @escaping (T?, Error?) -> Void) {
        networkManager.loadData(fromUrlString: url) { data, requestError in
            guard let data = data else {
                completion(nil, requestError)
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                completion(try jsonDecoder.decode(T.self, from: data), nil)
            } catch {
                completion(nil, RequestError.JsonDecodingError)
            }
        }
    }
}
