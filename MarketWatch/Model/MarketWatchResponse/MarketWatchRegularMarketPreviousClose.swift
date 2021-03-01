//
//  MarketWatchRegularMarketPreviousClose.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on February 28, 2021

import Foundation

struct MarketWatchRegularMarketPreviousClose : Codable {

        let fmt : String?
        let raw : Float?

        enum CodingKeys: String, CodingKey {
                case fmt = "fmt"
                case raw = "raw"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
                raw = try values.decodeIfPresent(Float.self, forKey: .raw)
        }

}
