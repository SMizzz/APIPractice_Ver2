//
//  MovieData.swift
//  APIPractice
//
//  Created by 신미지 on 2021/06/24.
//

import Foundation

// #1 & #3 - Alamofire, Json Parsing Networking
struct Movie: Codable {
  // 이미지, 영화제목, 장르, 평점, 내용
  var thumbNailImage: String? = ""
  var movieName: String = ""
  var releaseDate: String = ""
  var average: Float = 0.0
  var overview: String = ""
  
  enum CodingKeys: String, CodingKey {
    case thumbNailImage = "poster_path"
    case movieName = "original_name"
    case releaseDate = "first_air_date"
    case average = "vote_average"
    case overview
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    thumbNailImage = try? values.decode(String.self, forKey: .thumbNailImage) ?? "https://images-na.ssl-images-amazon.com/images/I/81u6wFnRDHL._AC_SL1500_.jpg"
    movieName = try values.decode(String.self, forKey: .movieName)
    releaseDate = try values.decode(String.self, forKey: .releaseDate)
    average = try values.decode(Float.self, forKey: .average)
    overview = try values.decode(String.self, forKey: .overview)
  }
}

struct MovieDataStore: Codable {
  var results: [Movie]
}

// #2 UrlSession Networking
/*
struct Movie {
  var thumbNailImage: String = ""
  var movieName: String = ""
  var average: Float = 0.0
  var overview: String = ""
}

struct MovieDataStore {
  var results: [Movie]
}
*/
