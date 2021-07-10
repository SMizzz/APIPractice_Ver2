//
//  MovieNetworkManager.swift
//  APIPractice
//
//  Created by 신미지 on 2021/07/10.
//

import Moya
import SwiftyJSON

class MovieNetworkManager {
  static let provider = MoyaProvider<MovieAPI>()
  static func getMovieData(
    completion: @escaping([Movie]) -> ()
  ) {
    provider.request(.getMovieData) { (result) in
      switch result {
      case .success(let res):
        do {
          let movieData = try JSONDecoder().decode(MovieDataStore.self, from: res.data)
          completion(movieData.results)
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
