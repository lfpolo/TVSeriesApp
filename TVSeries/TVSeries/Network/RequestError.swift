//
//  RequestError.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 18/05/22.
//

public enum RequestError: String, Error {
    case InvalidURLError = "Invalid URL"
    case JsonDecodingError = "Json Decoding Error"
}
