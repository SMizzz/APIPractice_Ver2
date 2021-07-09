//
//  NewsAPI.swift
//  APIPractice
//
//  Created by 신미지 on 2021/07/08.
//

import Moya

enum NewsAPI {
  case getNewsData
}

extension NewsAPI: TargetType {
  var baseURL: URL {
    guard let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2021-07-08&to=2021-07-08&sortBy=popularity&apiKey=bcf80c4a265f477c938a56371af7284d") else { fatalError("url error") }
    return url
  }
  
  var path: String {
    switch self {
    case .getNewsData:
      return ""
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .getNewsData:
      return .get
    default:
      return .post
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .getNewsData:
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
