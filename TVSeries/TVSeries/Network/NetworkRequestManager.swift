//
//  NetworkManager.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 15/05/22.
//

import Foundation

class NetworkRequestManager: NetworkRequestManagerProtocol {
    func loadData(fromUrlString urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let encodedUrl = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: encodedUrl) else {
            completion(nil, RequestError.InvalidURLError)
            return
        }
                
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, error)
        }.resume()
    }
}
