//
//  Constants.swift
//  MarketWatch
//
//  Created by Senrysa on 28/02/21.
//

import Foundation

class Constants: NSObject {
    
}

let ApplicationName = "MarketWatch"
let No_Network_Connection = "No Network Connection"

// MARK:REST API STATUS CODE

let API_HEADER_FIELD_NONE_MATCH             : String    = "If-None-Match"
let API_REQUEST_SUCCESS                     : Int       = 200 // Ok
let API_SIGNUP_SUCCESS                     : Int        = 201 // created
let API_DELETE_SUCCESS                     : Int        = 204 // no content
let API_NO_RECORD_FOUND                     : Int       = 404 //no record found
let API_NOT_MODIFIED                     : Int          = 304 //no record found
let API_INTERNAL_SERVER_ERROR               : Int       = 500 // Internal Server Error
let API_Unprocessable_Entity               : Int        = 422
let API_UNAUTHORIZED                       : Int        = 401 // Unauthorized
let API_NOT_FOUND                     : Int        = 400 // Unauthorized
let API_FORBIDDEN                     : Int        = 403 // Unauthorized
