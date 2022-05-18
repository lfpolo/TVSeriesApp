//
//  CastCredit.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 18/05/22.
//

struct CastCredit: Decodable {
    var _embedded: CastCreditEmbeddedData
    
    struct CastCreditEmbeddedData: Decodable {
        var show: TVShow
    }
}
