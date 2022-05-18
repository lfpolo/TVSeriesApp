//
//  ShowSchedule.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 17/05/22.
//

struct TVShowSchedule: Decodable {
    var time: String
    var days: [String]
    
    var scheduleDescription: String {
        var result = String()
        if days.count > 0 { result = days.joined(separator: " | ") }
        if !time.isEmpty { result += " at " + time }
        return result
    }
}
