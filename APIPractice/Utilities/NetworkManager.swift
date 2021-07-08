//
//  NetworkManager.swift
//  APIPractice
//
//  Created by 신미지 on 2021/07/06.
//

import Moya
import SwiftyJSON

class NetworkManager {
  static let provider = MoyaProvider<API>()
  static func getPostData(
    completion: @escaping([Post]) -> ()
  ) {
    
    provider.request(.getPostData) { (result) in
      switch result {
      case .success(let res):
        do {
          let postData = try JSONDecoder().decode([Post].self, from: res.data)
          completion(postData)
        } catch let err {
          print(err)
        }
      case .failure(let err):
        print(err.localizedDescription)
        return
      }
    }
  }
}
