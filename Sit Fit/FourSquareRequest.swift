//
//  FourSquareRequest.swift
//  Maps
//
//  Created by andrew Mcdonald on 2/2/15.
//  Copyright (c) 2015 Andrew McDonald. All rights reserved.
//

import UIKit
import CoreLocation

let API_URL = "https://api.foursquare.com/v2/"
let CLIENT_ID = "NNFATBTIULZMWUZLYP3LDP50KN1BRDMEKQOQO5WDT5ZBORJV"
let CLIENT_SECRET = "0RK3GYGUXELBTDBDRSLDESZUMAFHD1FZ0A32W4D4Z1LKOQEC"


class FourSquareRequest: NSObject {
   
    class func requestVenuesWithLocation(location: CLLocation) ->
        [AnyObject] {
            
        let requestString = "\(API_URL)venues/search?client_id=\(CLIENT_ID)&client_secret=\(CLIENT_SECRET)&v=20130815&ll=\(location.coordinate.latitude),\(location.coordinate.longitude)"
        
        println(requestString)
        
        if let url = NSURL(string: requestString) {
            
            let request = NSURLRequest(URL: url)
       
            if let data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil) {
                
                
                if let returnInfo = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: nil) as? [String:AnyObject] {
                    
                    println(returnInfo)
                    
                    let responseInfo = returnInfo["response"] as [String:AnyObject]
                    
                    let venues = responseInfo["venues"] as [AnyObject]
                    
                    return venues
                    
                
                
                }
               
            }
            
        }
           
            
       //TODO: add implementation to return venues
            
        return[]
        
    }
    
}
