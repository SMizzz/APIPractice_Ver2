//
//  NewsViewController.swift
//  APIPractice
//
//  Created by 신미지 on 2021/06/23.
//

import UIKit
import Alamofire
import Kingfisher

class NewsViewController: UIViewController {
  // MARK: - Properties
  private let newsCellId = "newsCellId"
  private let newsApiUrlString: String = "https://newsapi.org/v2/everything?q=apple&from=2021-06-22&to=2021-06-22&sortBy=popularity&apiKey=bcf80c4a265f477c938a56371af7284d"
  private var newsData = [News]()
  
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
    super.viewDidLoad()
    setup()
    addViews()
    setConstraints()
  }
  
  // MARK: - Handlers
  private func setup() {
    view.backgroundColor = .white
    configureCollectionView()
    configureAlamofire()
  }
  
  private func addViews() {
    view.addSubview(collectionView)
  }
  
  private func setConstraints() {
    collectionViewConstraints()
  }
  
  private func configureCollectionView() {
    collectionView.register(
      NewsCell.self,
      forCellWithReuseIdentifier: newsCellId)
    collectionView.dataSource = self
    collectionView.delegate = self
  }
  
  private func configureAlamofire() {
    getData()
  }
  
  private func getData() {
    guard let newsUrl = URL(string: newsApiUrlString) else { return }
    let request = URLRequest(url: newsUrl)
    
    AF.request(request).responseData { (response) in
      print(response.result)
      switch response.result {
      case .success(let data):
        self.parseJsonData(data: data)
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
  
  func parseJsonData(data: Data) -> [News] {
    do {
      let decoder = JSONDecoder()
      let newsDataStore = try decoder.decode(NewsDataStore.self, from: data)
      self.newsData = newsDataStore.articles
    } catch let error {
      print(error)
    }
    return newsData
  }
  
  
  // MARK: - Constraints
  private func collectionViewConstraints() {
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 45).isActive = true
    collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  }
}

extension NewsViewController:
  UICollectionViewDelegateFlowLayout,
  UICollectionViewDelegate,
  UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return newsData.count
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: newsCellId,
      for: indexPath) as! NewsCell
    let news = newsData[indexPath.item]
   
    cell.thumbNailImageView.kf.setImage(with: URL(string: news.thumbImage))
    cell.titleLabel.text = news.title
    cell.authorLabel.text = news.author
    cell.contentLabel.text = news.content
    return cell
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    return CGSize(
      width: view.frame.width - 40,
      height: view.frame.height)
  }
}
