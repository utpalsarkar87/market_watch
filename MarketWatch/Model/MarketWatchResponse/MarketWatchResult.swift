//
//  MarketWatchResult.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on February 28, 2021

import Foundation

struct MarketWatchResult : Codable {

        let exchange : String?
        let exchangeDataDelayedBy : Int?
        let exchangeTimezoneName : String?
        let exchangeTimezoneShortName : String?
        let firstTradeDateMilliseconds : Int?
        let fullExchangeName : String?
        let gmtOffSetMilliseconds : Int?
        let language : String?
        let market : String?
        let marketState : String?
        let priceHint : Int?
        let quoteType : String?
        let region : String?
        let regularMarketPreviousClose : MarketWatchRegularMarketPreviousClose?
        let regularMarketTime : MarketWatchRegularMarketTime?
        let shortName : String?
        let sourceInterval : Int?
        let spark : MarketWatchSpark?
        let symbol : String?
        let tradeable : Bool?
        let triggerable : Bool?

        enum CodingKeys: String, CodingKey {
                case exchange = "exchange"
                case exchangeDataDelayedBy = "exchangeDataDelayedBy"
                case exchangeTimezoneName = "exchangeTimezoneName"
                case exchangeTimezoneShortName = "exchangeTimezoneShortName"
                case firstTradeDateMilliseconds = "firstTradeDateMilliseconds"
                case fullExchangeName = "fullExchangeName"
                case gmtOffSetMilliseconds = "gmtOffSetMilliseconds"
                case language = "language"
                case market = "market"
                case marketState = "marketState"
                case priceHint = "priceHint"
                case quoteType = "quoteType"
                case region = "region"
                case regularMarketPreviousClose = "regularMarketPreviousClose"
                case regularMarketTime = "regularMarketTime"
                case shortName = "shortName"
                case sourceInterval = "sourceInterval"
                case spark = "spark"
                case symbol = "symbol"
                case tradeable = "tradeable"
                case triggerable = "triggerable"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                exchange = try values.decodeIfPresent(String.self, forKey: .exchange)
                exchangeDataDelayedBy = try values.decodeIfPresent(Int.self, forKey: .exchangeDataDelayedBy)
                exchangeTimezoneName = try values.decodeIfPresent(String.self, forKey: .exchangeTimezoneName)
                exchangeTimezoneShortName = try values.decodeIfPresent(String.self, forKey: .exchangeTimezoneShortName)
                firstTradeDateMilliseconds = try values.decodeIfPresent(Int.self, forKey: .firstTradeDateMilliseconds)
                fullExchangeName = try values.decodeIfPresent(String.self, forKey: .fullExchangeName)
                gmtOffSetMilliseconds = try values.decodeIfPresent(Int.self, forKey: .gmtOffSetMilliseconds)
                language = try values.decodeIfPresent(String.self, forKey: .language)
                market = try values.decodeIfPresent(String.self, forKey: .market)
                marketState = try values.decodeIfPresent(String.self, forKey: .marketState)
                priceHint = try values.decodeIfPresent(Int.self, forKey: .priceHint)
                quoteType = try values.decodeIfPresent(String.self, forKey: .quoteType)
                region = try values.decodeIfPresent(String.self, forKey: .region)
                regularMarketPreviousClose = try values.decodeIfPresent(MarketWatchRegularMarketPreviousClose.self, forKey: .regularMarketPreviousClose)
                regularMarketTime = try values.decodeIfPresent(MarketWatchRegularMarketTime.self, forKey: .regularMarketTime)
                shortName = try values.decodeIfPresent(String.self, forKey: .shortName)
                sourceInterval = try values.decodeIfPresent(Int.self, forKey: .sourceInterval)
                spark = try values.decodeIfPresent(MarketWatchSpark.self, forKey: .spark)
                symbol = try values.decodeIfPresent(String.self, forKey: .symbol)
                tradeable = try values.decodeIfPresent(Bool.self, forKey: .tradeable)
                triggerable = try values.decodeIfPresent(Bool.self, forKey: .triggerable)
        }

}
