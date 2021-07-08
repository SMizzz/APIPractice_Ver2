//
//  AuthAPI.swift
//  APIPractice
//
//  Created by 신미지 on 2021/07/05.
//

import Foundation
import Moya

enum API {
//  case getPostData(userId: Int, id: Int, title: String, body: String)
  case getPostData
}

extension API: TargetType {
  var baseURL: URL {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com") else { fatalError("url error") }
    return url
  }
  
  var path: String {
    switch self {
    case .getPostData:
      return "/posts"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .getPostData:
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
    case .getPostData:
//      return .requestParameters(parameters: ["userId": userId, "id": id, "title": title, "body": body], encoding: JSONEncoding.default)
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
