//
//  NewsNetworkManager.swift
//  APIPractice
//
//  Created by 신미지 on 2021/07/08.
//

import Moya
import SwiftyJSON

class NewsNetworkManager {
  static let provider = MoyaProvider<NewsAPI>()
  static func getNewsData(
    completion: @escaping([News]) -> ()
  ) {
    provider.request(.getNewsData) { (result) in
      switch result {
      case .success(let res):
        do {
          let newsData = try JSONDecoder().decode(NewsDataStore.self, from: res.data)
          completion(newsData.articles)
        } catch let err {
          print(err.localizedDescription)
          return
        }
      case .failure(let err):
        print(err.localizedDescription)
        return
      }
    }
  }
}
