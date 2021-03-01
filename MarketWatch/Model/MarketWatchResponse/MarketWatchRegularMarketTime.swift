//
//  MarketWatchRegularMarketTime.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on February 28, 2021

import Foundation

struct MarketWatchRegularMarketTime : Codable {

        let fmt : String?
        let raw : Int?

        enum CodingKeys: String, CodingKey {
                case fmt = "fmt"
                case raw = "raw"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
                raw = try values.decodeIfPresent(Int.self, forKey: .raw)
        }

}
