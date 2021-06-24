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
    configureAlamofire()
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
    let movie = movieData[indexPath.item]
    cell.movieThumbnailImageView.kf.setImage(
      with: URL(string: "https://image.tmdb.org/t/p/w500\(movie.thumbNailImage)"))
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
    guard let indexPath = collectionView.indexPath(for: cell) else { return}
    let movieDetailVC = MovieDetailViewController()
    let movie = movieData[indexPath.item]
    movieDetailVC.detailView.movieThumbnailImageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(movie.thumbNailImage)"))
    movieDetailVC.detailView.movieNameLabel.text = movie.movieName
    movieDetailVC.detailView.averageCountLabel.text = "⭐\(movie.average)"
    movieDetailVC.detailView.overviewLabel.text = movie.overview
    navigationController?.pushViewController(movieDetailVC, animated: true)
  }
}
