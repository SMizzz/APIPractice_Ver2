//
//  PostViewController.swift
//  APIPractice
//
//  Created by 신미지 on 2021/06/22.
//

import UIKit
import Alamofire

class PostViewController: UIViewController {
  // MARK: - Properties
  private let postCellId = "postCellId"
  private let postUrlString = "https://jsonplaceholder.typicode.com/posts"
  private var posts = [Post]()
  
  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.backgroundColor = .white
    cv.clipsToBounds = true
    cv.layer.cornerRadius = 20
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
    view.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
//    configureAlamofire()
//    configureURLSession()
    configureJsonParsing()
    configureCollectionView()
  }
  
  private func addViews() {
    view.addSubview(collectionView)
  }
  
  private func setConstraints() {
    collectionViewConstraints()
  }
  
  private func configureCollectionView() {
    collectionView.register(
      PostCell.self,
      forCellWithReuseIdentifier: postCellId)
    collectionView.dataSource = self
    collectionView.delegate = self
  }
  
  private func configureJsonParsing() {
    getData()
  }
  
  private func getData() {
    guard let postUrl = URL(string: postUrlString) else { return }
    let request = URLRequest(url: postUrl)
    
    URLSession.shared.dataTask(with: request) { (data, response, error) in
      if error != nil {
        print(error?.localizedDescription)
        return
      }
      
      do {
        self.jsonParseData(data: data!)
        
        OperationQueue.main.addOperation {
          self.collectionView.reloadData()
          return
        }
      } catch let error {
        print(error.localizedDescription)
        return
      }
      
    }.resume()
  }
  
  func jsonParseData(data: Data) -> [Post] {
    do {
      let decoder = JSONDecoder()
      posts = try decoder.decode([Post].self, from: data)
    } catch let error {
      print(error.localizedDescription)
    }
    return posts
  }
  
//  private func configureAlamofire() {
//    getData()
//  }
  
  // #2 URLSession (2)
  /*
  private func configureURLSession() {
    guard let postUrl = URL(string: postUrlString) else { return }
    let request = URLRequest(url: postUrl)
    URLSession.shared.dataTask(with: request) { (data, response, error) in
      if error != nil {
        print(error?.localizedDescription)
        return
      }
      
      do {
        let jsonResultArray = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [NSDictionary]
        guard let jsonPost = jsonResultArray else { return }
        print(jsonPost)
        
        for post in jsonPost {
          var postData = Post()
          postData.userId = post["userId"] as! Int
          postData.id = post["id"] as! Int
          postData.title = post["title"] as! String
          postData.body = post["body"] as! String
          
          self.posts.append(postData)
        }
    
        OperationQueue.main.addOperation {
          self.collectionView.reloadData()
        }
        
      } catch let error {
        print(error)
      }
    }.resume()
  }
 */
  
  // #1 Alamofire - get data(1)
  /*
  func getData() {
    guard let postUrl = URL(string: postUrlString) else { return }
    let request = URLRequest(url: postUrl)
    AF.request(request).responseData { (response) in
      print(response.result)
      switch response.result {
      case .success(let data):
        print("=========\(data)")
        self.posts = self.parseJsonData(data: data)
        OperationQueue.main.addOperation {
          self.collectionView.reloadData()
        }
        break
      case .failure(let error):
        print(error)
        break
      }
    }.resume()
  }
  
  func parseJsonData(data: Data) -> [Post] {
    do {
      let decoder = JSONDecoder()
      posts = try decoder.decode([Post].self, from: data)
    } catch let error {
      print(error)
    }
    return posts
  }
  */
  // MARK: - Constraints
  private func collectionViewConstraints() {
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.94).isActive = true
    collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 45).isActive = true
  }
}

extension PostViewController:
  UICollectionViewDelegateFlowLayout,
  UICollectionViewDelegate,
  UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return posts.count
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: postCellId,
      for: indexPath) as! PostCell
    let postsData = posts[indexPath.item]
    cell.userIDLabel.text = "\(postsData.userId)"
    cell.postIdLabel.text = "\(postsData.id)"
    cell.titleLabel.text = postsData.title
    cell.bodyContentLabel.text = postsData.body
    return cell
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    return CGSize(width: view.frame.width - 30, height: 310)
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int
  ) -> CGFloat {
    return 15
  }
}
