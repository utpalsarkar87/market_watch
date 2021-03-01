//
//  MWAPIClient.swift
//  MarketWatch
//
//  Created by Senrysa on 27/02/21.
//

import Foundation
import Alamofire

public let BASE_URL = "https://apidojo-yahoo-finance-v1.p.rapidapi.com/market/v2/"
public let RAPID_API_KEY = "d026d489d2msh03fef0ad9631515p1f177bjsn76180450539b"
public let RAPID_API_HOST = "apidojo-yahoo-finance-v1.p.rapidapi.com"

typealias ServiceResponse = (NSDictionary?, NSError?, AFDataResponse<Any>?) -> Void
typealias ServiceResponseString = (NSString?, NSError?) -> Void

func printNew(items: Any..., separator: String = " ", terminator: String = "\n") {
    #if DEBUG
    Swift.print(items[0], separator:separator, terminator: terminator)
    #endif
}

class MWAPIClient: NSObject {
    class  var sharedInstance: MWAPIClient {
        struct singleton {
            static let instance=MWAPIClient()
        }
        return singleton.instance
    }
    
    //MARK:NETWORK MANAGER
    
    internal class NetworkManager{
        static var sharedManager:NetworkReachabilityManager={
            let manager = NetworkReachabilityManager()
            return manager!
        }()
    }
    
    func getUrls(type:MWURL,parameters:Dictionary<String, Any>) -> String {
        //let input = parameters["input"] as AnyObject
        //let key = parameters["key"] as AnyObject
        return BASE_URL + "get-summary?symbol=AMRN&region=US"
    }
    
    func getRequestWithURL(parameters : [String : AnyObject], url : MWURL, onCompletion :@escaping ServiceResponse ) {
        let requestUrl = getUrls(type:url, parameters: parameters)
        
        printNew(items: "URL:\(requestUrl)")
        
        
        
        let headers : HTTPHeaders = [
            "x-rapidapi-key": RAPID_API_KEY,
            "x-rapidapi-host" : RAPID_API_HOST
            //"Content-Type": "application/json"
            //"Accept":"application/json",
            
        ]
        
        AF.request(getUrls(type: url, parameters: parameters), method: .get, parameters: .none, encoding: JSONEncoding.default, headers: headers, interceptor: nil).responseJSON { responseObject in switch responseObject.result {
            
        case .success(let jsonObject):
            //printNew(items: responseObject)
            //printNew(items: jsonObject)
            //self.logoutForInvalidToken(jsonDataFromServer: jsonObject, responseObj: responseObject)
            onCompletion(jsonObject as? NSDictionary, nil,responseObject as? AFDataResponse<Any>)
            break
        case .failure(let error):
            printNew(items: error)
            
            onCompletion(nil, error as NSError,responseObject)
            break
            }
        }
    }
}
