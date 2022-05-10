//
//  Item.swift
//  WDSwiftStudy
//
//  Created by 蒋伟东 on 2022/5/10.
//

import Foundation
import KakaJSON
import HandyJSON
import SwiftUI
import Accelerate

/*
 age = 25;
 astrology = "\U5904\U5973\U5ea7";
 gender = F;
 icon = "20180815155131.jpg";
 id = 34316448;
 login = "\U82cf\U8096\U7b71";
 medium = "http://pic.qiushibaike.com/system/avtnew/3431/34316448/medium/20180815155131.webp";
 rel = "no_rel";
 role = n;
 state = active;
 thumb = "http://pic.qiushibaike.com/system/avtnew/3431/34316448/thumb/20180815155131.webp";
 uid = 34316448;
 */
class User : Convertible ,HandyJSON{
    let age: Int = 0
    let astrology: String = ""
    let gender: String = ""
    let icon: String = ""
    let id: String = ""
    let login: String = ""
    let medium: String = ""
    let rel: String = ""
    let role: String = ""
    let state: String = ""
    let thumb: String = ""
    let uid: String = ""

    required init() {
        
    }
}

class Comment : Convertible ,HandyJSON{
    
    required init() {
        
    }
}

/*
 format = image;
 "high_url" = "//pic.qiushibaike.com/article/image/JDB74REHJL01QHJP.webp";
 "image_size" =                 {
     m =                     (
         869,
         722,
         34674
     );
     s =                     (
         869,
         722,
         34674
     );
 };
 "low_url" = "//pic.qiushibaike.com/article/image/JDB74REHJL01QHJP_small.webp";
 "origin_url" = "//pic.qiushibaike.com/article/image/JDB74REHJL01QHJP";
 status = private;
 */
class attachment: HandyJSON {
    let format: String = ""
    let high_url: String = ""
    let image_size: [String : [String]]? = [:]
    let low_url: String = ""
    let origin_url: String = ""
    let status: String = ""

    required init() {
        
    }
}

/*
 "comments_count" = 0;
 content = "\U4e0d\U60f3\U7ec3\U53ef\U4ee5\U4e0d\U7ec3";
 "created_at" = 1652073740;
 format = multi;
 id = 125398491;
 image = "";
 "is_prefer" = "<null>";
 "is_promote" = "<null>";
 "published_at" = 1652073740;
 "share_count" = 0;
 src = 1;
 state = publish;
 tag = "";
 "allow_comment" = 1;
 */



class Item : Convertible ,HandyJSON{
    let content: String = ""
    let comments_count: Int = 0
    let created_at: Int = 0
    let id: String = ""
    let image:  String = ""
    let is_prefer:  String = ""
    let is_promote:  String = ""
    let published_at:  String = ""
    let share_count:  String = ""
    let src: Int = 0
    
    let state: String = ""
    let tag: String = ""
    let allow_comment: String = ""
    let user: User! = nil
    let attachments: [attachment]? = []
    
    func kj_modelKey(from property: Property) -> ModelPropertyKey {
        return property.name.kj.underlineCased()
    }
    required init() {
        
    }
}

/*
 
 {
 
 attachments =         (
                 {
         format = image;
         "high_url" = "//pic.qiushibaike.com/article/image/JDB74REHJL01QHJP.webp";
         "image_size" =                 {
             m =                     (
                 869,
                 722,
                 34674
             );
             s =                     (
                 869,
                 722,
                 34674
             );
         };
         "low_url" = "//pic.qiushibaike.com/article/image/JDB74REHJL01QHJP_small.webp";
         "origin_url" = "//pic.qiushibaike.com/article/image/JDB74REHJL01QHJP";
         status = private;
     },
                 {
         format = image;
         "high_url" = "//pic.qiushibaike.com/article/image/YT16S30SCP0OS2BP.webp";
         "image_size" =                 {
             m =                     (
                 714,
                 737,
                 34567
             );
             s =                     (
                 714,
                 737,
                 34567
             );
         };
         "low_url" = "//pic.qiushibaike.com/article/image/YT16S30SCP0OS2BP_small.webp";
         "origin_url" = "//pic.qiushibaike.com/article/image/YT16S30SCP0OS2BP";
         status = private;
     }
 );
 
 user =         {
     age = 25;
     astrology = "\U5904\U5973\U5ea7";
     gender = F;
     icon = "20180815155131.jpg";
     id = 34316448;
     login = "\U82cf\U8096\U7b71";
     medium = "http://pic.qiushibaike.com/system/avtnew/3431/34316448/medium/20180815155131.webp";
     rel = "no_rel";
     role = n;
     state = active;
     thumb = "http://pic.qiushibaike.com/system/avtnew/3431/34316448/thumb/20180815155131.webp";
     uid = 34316448;
 };
 votes =         {
     down = 0;
     up = 335;
 };
 
 */
