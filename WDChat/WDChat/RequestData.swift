//
//  RequestData.swift
//  WDSwiftStudy
//
//  Created by 蒋伟东 on 2022/5/10.
//

import Foundation
import Alamofire
import HandyJSON
import KakaJSON

class URLAPI {
    static let shared : URLAPI = URLAPI()
    private init() {
        
    }
    let imgRank = "http://m2.qiushibaike.com/article/list/imgrank"
    func getDataimgRank(_ url: String, completion: @escaping (Any,Bool) -> Void) {
        
        var itemModels = Array<Item>()

        AF.request(url,parameters:["page":1]).responseData { response in
            
            guard let data = response.data else {return}
            
            let json = try? JSONSerialization
                .jsonObject(with: data, options: .mutableContainers) as? [String:Any]

            if let items = json?["items"] {
                print(items)
                for item in (items as! [[String:Any]]) {
                    let itemModel = Item.deserialize(from: item)
                    print(itemModel?.user.login as Any)
                    
                    itemModels.append(itemModel!)
                }
                
                completion(itemModels,true)
            }
        }

    }
}


