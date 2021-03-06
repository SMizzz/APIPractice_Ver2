//
//  MovieViewController.swift
//  APIPractice
//
//  Created by 신미지 on 2021/06/24.
//

import UIKit
import Alamofire
import Kingfisher

class MovieViewController: UIViewController {
  // MARK: - Properties
  private let movieUrlString = "https://api.themoviedb.org/3/tv/airing_today?api_key=8597e491ed6e80f0de12e349eb60ea6e&language=en-US&page=1"
  private let movieCellId = "movieCellId"
  private var movieData = [Movie]()
  let topView = MovieTopView()
  
  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let cv = UICollectionView(
      frame: .zero,
      collectionViewLayout: layout)
    cv.backgroundColor = .white
    return cv
  }()
  
  // MARK: - Init
  override func viewDidLoad() {
    setup()
    addViews()
    setConstraints()
  }
  
  // MARK: - Handlers
  private func setup() {
    view.backgroundColor = .white
    navigationController?.navigationBar.isHidden = true
    configureCollectionView()
    getData()
//    configureAlamofire()
//    configureUrlSession()
//    configureJsonParse()
  }
  
  private func addViews() {
    view.addSubview(topView)
    view.addSubview(collectionView)
  }
  
  private func setConstraints() {
    topViewConstraints()
    collectionViewConstraints()
  }
  
  private func configureCollectionView() {
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(
      MovieCell.self,
      forCellWithReuseIdentifier: movieCellId)
  }
  
  private func getData() {
    MovieNetworkManager.getMovieData { (movie) in
      self.movieData = movie
      self.collectionView.reloadData()
    }
  }
  
  // #3 Json Parsing - Networking
//  private func configureJsonParse() {
//    getData()
//  }
  
/*
  private func getData() {
    guard let movieUrl = URL(string: movieUrlString) else { return }
    let request = URLRequest(url: movieUrl)
    
    URLSession.shared.dataTask(with: request) { [self] (data, response, error) in
      if error != nil {
        print(error?.localizedDescription)
        return
      }
      do {
        self.movieData = self.jsonParseData(data: data!)
        OperationQueue.main.addOperation {
          print("movie data is \(movieData)")
          self.collectionView.reloadData()
          return
        }
      } catch let error {
        print(error.localizedDescription)
        return
      }
    }.resume()
  }

  
  func jsonParseData(data: Data) -> [Movie] {
    do {
      let decoder = JSONDecoder()
      let movieDataStore = try decoder.decode(MovieDataStore.self, from: data)
      self.movieData = movieDataStore.results
    } catch let error {
      print(error.localizedDescription)
    }
    return movieData
  }
   */
  
  // #1 Alamofire - Networking

  /*
  private func configureAlamofire() {
    getData()
  }
  
  private func getData() {
    guard let movieUrl = URL(string: movieUrlString) else { return }
    let request = URLRequest(url: movieUrl)
    
    AF.request(request).responseData { (response) in
      switch response.result {
      case .success(let data):
        print(data)
        self.movieData = self.parseJsonData(data: data)
        OperationQueue.main.addOperation {
          self.collectionView.reloadData()
        }
        break
      case .failure(let error):
        print(error)
        break
      }
    }
  }
  
  func parseJsonData(data: Data) -> [Movie] {
    do {
      let decoder = JSONDecoder()
      let movieDataStore = try decoder.decode(MovieDataStore.self, from: data)
      self.movieData = movieDataStore.results
    } catch let error {
      print(error)
    }
    return movieData
  }
   */
  //#2 URLSession Networking
  /*
  private func configureUrlSession() {
    getData()
  }
  
  private func getData() {
    guard let movieUrl = URL(string: movieUrlString) else { return }
    let request = URLRequest(url: movieUrl)
    
    URLSession.shared.dataTask(with: request) { (data, response, error) in
      if error != nil {
        print(error?.localizedDescription)
        return
      }
      
      do {
        let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
        let jsonMovies = jsonResult!["results"] as! [AnyObject]
        
        for movies in jsonMovies {
          var movie = Movie()
          movie.thumbNailImage = movies["poster_path"] as! String
          movie.movieName = movies["original_name"] as! String
          movie.average = Float(movies["vote_average"] as! NSNumber)
          movie.overview = movies["overview"] as! String
          
          self.movieData.append(movie)
        }
        
        OperationQueue.main.addOperation {
          self.collectionView.reloadData()
        }
        
      } catch let error {
        print(error.localizedDescription)
      }
    }.resume()
  }
  */
  
  // MARK: - Constraints
  private func topViewConstraints() {
    topView.translatesAutoresizingMaskIntoConstraints = false
    topView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    topView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    topView.topAnchor.constraint(equalTo: view.topAnchor, constant: 45).isActive = true
    topView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  }
  
  private func collectionViewConstraints() {
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    collectionView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10).isActive = true
    collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  }
}

extension MovieViewController:
  UICollectionViewDelegateFlowLayout,
  UICollectionViewDelegate,
  UICollectionViewDataSource,
  MovieToDetailVCDelegate {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return movieData.count
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: movieCellId,
      for: indexPath) as! MovieCell
    cell.delegate = self
    if let image = movieData[indexPath.item].thumbNailImage {
      cell.movieThumbnailImageView.kf.setImage(
        with: URL(string: "https://image.tmdb.org/t/p/w500\(image)"))
    } else {
      cell.movieThumbnailImageView.kf.setImage(with: URL(string: "https://images-na.ssl-images-amazon.com/images/I/81u6wFnRDHL._AC_SL1500_.jpg"))
    }
    let movie = movieData[indexPath.item]
    cell.movieNameLabel.text = movie.movieName
    cell.averageCountLabel.text = "⭐\(movie.average)"
    return cell
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    return CGSize(
      width: view.frame.width - 50,
      height: view.frame.height)
  }
  
  func cellDelegate(cell: MovieCell) {
    guard let indexPath = collectionView.indexPath(for: cell) else { return }
    let movieDetailVC = MovieDetailViewController()
    let movie = movieData[indexPath.item]
    if let image = movieData[indexPath.item].thumbNailImage {
      movieDetailVC.detailView.movieThumbnailImageView.kf.setImage(
        with: URL(string: "https://image.tmdb.org/t/p/w500\(image)"))
    } else {
      movieDetailVC.detailView.movieThumbnailImageView.kf.setImage(with: URL(string: "https://images-na.ssl-images-amazon.com/images/I/81u6wFnRDHL._AC_SL1500_.jpg"))
    }
    movieDetailVC.detailView.movieNameLabel.text = movie.movieName
    movieDetailVC.detailView.averageCountLabel.text = "⭐\(movie.average)"
    movieDetailVC.detailView.overviewLabel.text = movie.overview
    navigationController?.pushViewController(movieDetailVC, animated: true)
  }
}
