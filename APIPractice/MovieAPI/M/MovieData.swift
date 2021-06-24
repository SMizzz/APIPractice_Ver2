//
//  MovieData.swift
//  APIPractice
//
//  Created by 신미지 on 2021/06/24.
//

import Foundation

struct Movie: Codable {
  // 이미지, 영화제목, 장르, 평점, 내용
  var thumbNailImage: String = ""
  var movieName: String = ""
  var genre: [Int] = []
  var average: Float = 0
  var overview: String = ""
  
  enum CodingKeys: String, CodingKey {
    case thumbNailImage = "poster_path"
    case movieName = "original_name"
    case genre = "genre_ids"
    case average = "vote_average"
    case overview
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    thumbNailImage = try values.decode(String.self, forKey: .thumbNailImage)
    movieName = try values.decode(String.self, forKey: .movieName)
    genre = try values.decode([Int].self, forKey: .genre)
    average = try values.decode(Float.self, forKey: .average)
    overview = try values.decode(String.self, forKey: .overview)
  }
}

struct MovieDataStore: Codable {
  var results: [Movie]
}
