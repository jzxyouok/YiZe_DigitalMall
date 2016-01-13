//
//  GoodsReposityNet.swift
//  		
//
//  Created by dmqlMAC on 16/1/12.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import Foundation

func GetSort1stSub() -> [GoodsSort1st]?
{
    var GoodsSort1stGet = [GoodsSort1st]()
    
    if let url = NSURL(string: NSString(format: "%@%@", BaseUrl , "GetGoodsType.ashx") as String) {
        let postRequest = NSMutableURLRequest(URL: url)
        postRequest.timeoutInterval = 3.0
        postRequest.HTTPMethod = "POST"

        if let response = try? NSURLConnection.sendSynchronousRequest(postRequest, returningResponse: nil) {
            let responsestr = NSString(data: response, encoding: NSUTF8StringEncoding)
            print(responsestr)

            let json = JSON(data: response)
            
            for i in 0..<json.count{
                //Do something you want
                GoodsSort1stGet.append(GoodsSort1st(GoodsSort1st_ID: json[i]["GoodsCategory_ID"].stringValue, GoodsSort1st_Name: json[i]["GoodsCategory_Name"].stringValue))
            }
        }
        else{
            return nil
        }
    }
    return GoodsSort1stGet
}

func GetSort2ndSub(GoodsCategory_ID:String) -> [GoodsSort2nd]?
{
    var GetSort2ndGet = [GoodsSort2nd]()
    
    if let url = NSURL(string: NSString(format: "%@%@", BaseUrl , "GetGoodsSubType.ashx") as String) {
        let postRequest = NSMutableURLRequest(URL: url)
        postRequest.timeoutInterval = 3.0
        postRequest.HTTPMethod = "POST"
        let param = [
            "GoodsCategory_ID": GoodsCategory_ID
        ]
        let jsonparam = try? NSJSONSerialization.dataWithJSONObject(param, options: NSJSONWritingOptions.PrettyPrinted)
        postRequest.HTTPBody = jsonparam
        if let response = try? NSURLConnection.sendSynchronousRequest(postRequest, returningResponse: nil) {
            let responsestr = NSString(data: response, encoding: NSUTF8StringEncoding)
            print(responsestr)
            
            let json = JSON(data: response)
            
            for i in 0..<json.count{
                //Do something you want
                GetSort2ndGet.append(GoodsSort2nd(GoodsSort2nd_ID: json[i]["GoodsSubCategory_ID"].stringValue, GoodsSort2nd_Name: json[i]["GoodsSubCategory_Name"].stringValue))
            }
        }
        else{
            return nil
        }
    }
    return GetSort2ndGet
}

func SearchInfo(SearchInfoInGet:SearchInfoIn) -> [SearchInfoOut]?
{
    var SearchInfoOutGet = [SearchInfoOut]()
    
    if let url = NSURL(string: NSString(format: "%@%@", BaseUrl , "Search.ashx") as String) {
        let postRequest = NSMutableURLRequest(URL: url)
        postRequest.timeoutInterval = 3.0
        postRequest.HTTPMethod = "POST"
        let param = [
            "Goods_Name": SearchInfoInGet.Goods_Name! as String,
            "GoodsSubCategory_ID": SearchInfoInGet.GoodsSort2nd_ID! as String
        ]
        let jsonparam = try? NSJSONSerialization.dataWithJSONObject(param, options: NSJSONWritingOptions.PrettyPrinted)
        postRequest.HTTPBody = jsonparam
        if let response = try? NSURLConnection.sendSynchronousRequest(postRequest, returningResponse: nil) {
            let responsestr = NSString(data: response, encoding: NSUTF8StringEncoding)
            print(responsestr)
            
            let json = JSON(data: response)
            for i in 0..<json.count{
                //Do something you want
                SearchInfoOutGet.append(SearchInfoOut(Goods_ID: json[i]["Goods_ID"].stringValue, Goods_Name: json[i]["Goods_Name"].stringValue, Goods_Image: json[i]["Goods_Image"] != nil ? BaseUrlImg + json[i]["Goods_Image"].string! : "", Goods_MarketPrice: json[i]["Goods_MarketPrice"].stringValue, Goods_MemberPrice: json[i]["Goods_MemberPrice"].stringValue))
            }
        }
        else{
            return nil
        }
    }
    return SearchInfoOutGet
}
