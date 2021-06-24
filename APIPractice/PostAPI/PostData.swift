//
//  PostData.swift
//  APIPractice
//
//  Created by 신미지 on 2021/06/22.
//

import Foundation

// #1 - Alamofire Networking
/*
struct Post: Codable {
  var userId: Int = 0
  var id: Int = 0
  var title: String = ""
  var body: String = ""
  
  enum CodingKeys: String, CodingKey {
    case userId
    case id
    case title
    case body
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    userId = try values.decode(Int.self, forKey: .userId)
    id = try values.decode(Int.self, forKey: .id)
    title = try values.decode(String.self, forKey: .title)
    body = try values.decode(String.self, forKey: .body)
  }
}
 */

// #2 - URLSession Networking
struct Post {
  var userId: Int = 0
  var id: Int = 0
  var title: String = ""
  var body: String = ""
}
