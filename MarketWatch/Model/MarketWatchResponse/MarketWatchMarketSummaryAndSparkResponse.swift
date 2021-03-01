//
//  MarketWatchMarketSummaryAndSparkResponse.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on February 28, 2021

import Foundation

struct MarketWatchMarketSummaryAndSparkResponse : Codable {

        //let error : AnyObject?
        let result : [MarketWatchResult]?

        enum CodingKeys: String, CodingKey {
                //case error = "error"
                case result = "result"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                //error = try values.decodeIfPresent(AnyObject.self, forKey: .error)
                result = try values.decodeIfPresent([MarketWatchResult].self, forKey: .result)
        }

}
