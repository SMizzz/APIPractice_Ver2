//
//  MovieAPI.swift
//  APIPractice
//
//  Created by 신미지 on 2021/07/10.
//

import Moya

enum MovieAPI {
  case getMovieData
}

extension MovieAPI: TargetType {
  var baseURL: URL {
    guard let url = URL(string: "https://api.themoviedb.org/3/tv/airing_today?api_key=8597e491ed6e80f0de12e349eb60ea6e&language=en-US&page=1") else { fatalError("url error") }
    return url
  }
  
  var path: String {
    switch self {
    case .getMovieData:
      return ""
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .getMovieData:
      return .get
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .getMovieData:
      return .requestPlain
    }
  }
  
  var headers: [String : String]? {
    switch self {
    default:
      return ["Content-Type": "application/json"]
    }
  }
}
