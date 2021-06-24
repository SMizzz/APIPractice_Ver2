//
//  NewsData.swift
//  APIPractice
//
//  Created by 신미지 on 2021/06/23.
//

import Foundation

struct News: Codable {
  var thumbImage: String = ""
  var title: String = ""
  var author: String = ""
  var content: String = ""
  
  enum CodingKeys: String, CodingKey {
    case thumbImage = "urlToImage"
    case title
    case author
    case content
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    title = try values.decode(String.self, forKey: .title)
    author = try values.decode(String.self, forKey: .author)
    content = try values.decode(String.self, forKey: .content)
    thumbImage = try values.decode(String.self, forKey: .thumbImage)
  }
}

struct NewsDataStore: Codable {
  var articles: [News]
}
