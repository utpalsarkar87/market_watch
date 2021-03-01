//
//  MarketWatchSpark.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on February 28, 2021

import Foundation

struct MarketWatchSpark : Codable {

        let chartPreviousClose : Float?
        var close : [Float]?
        let dataGranularity : Int?
        let end : Int?
        let previousClose : Float?
        let start : Int?
        let symbol : String?
        let timestamp : [Int]?

        enum CodingKeys: String, CodingKey {
                case chartPreviousClose = "chartPreviousClose"
                case close = "close"
                case dataGranularity = "dataGranularity"
                case end = "end"
                case previousClose = "previousClose"
                case start = "start"
                case symbol = "symbol"
                case timestamp = "timestamp"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                chartPreviousClose = try values.decodeIfPresent(Float.self, forKey: .chartPreviousClose)
                close = try? values.decodeIfPresent([Float].self, forKey: .close)
                dataGranularity = try values.decodeIfPresent(Int.self, forKey: .dataGranularity)
                end = try values.decodeIfPresent(Int.self, forKey: .end)
                previousClose = try values.decodeIfPresent(Float.self, forKey: .previousClose)
                start = try values.decodeIfPresent(Int.self, forKey: .start)
                symbol = try values.decodeIfPresent(String.self, forKey: .symbol)
                timestamp = try values.decodeIfPresent([Int].self, forKey: .timestamp)
        }

}

class CompactDecodableArray<Element>: Decodable where Element: Decodable {
    private(set) var elements = [Element]()
    required init(from decoder: Decoder) throws {
        guard var unkeyedContainer = try? decoder.unkeyedContainer() else { return }
        while !unkeyedContainer.isAtEnd {
            if let value = try? unkeyedContainer.decode(Element.self) {
                elements.append(value)
            } else {
                unkeyedContainer.skip()
            }
        }
    }
}

// https://forums.swift.org/t/pitch-unkeyeddecodingcontainer-movenext-to-skip-items-in-deserialization/22151/17

struct Empty: Decodable { }

extension UnkeyedDecodingContainer {
    mutating func skip() { _ = try? decode(Empty.self) }
}
