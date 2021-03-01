//
//  MarketWatchResponse.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on February 28, 2021

import Foundation

struct MarketWatchResponse : Codable {

        let marketSummaryAndSparkResponse : MarketWatchMarketSummaryAndSparkResponse?

        enum CodingKeys: String, CodingKey {
                case marketSummaryAndSparkResponse = "marketSummaryAndSparkResponse"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                marketSummaryAndSparkResponse = try values.decodeIfPresent(MarketWatchMarketSummaryAndSparkResponse.self, forKey: .marketSummaryAndSparkResponse)
        }

}
