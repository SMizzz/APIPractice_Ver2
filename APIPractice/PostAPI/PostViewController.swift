//
//  PostViewController.swift
//  APIPractice
//
//  Created by 신미지 on 2021/06/22.
//

import UIKit

class PostViewController: UIViewController {
  // MARK: - Properties
  private let postCellId = "postCellId"
  
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
    configureCollectionView()
  }
  
  private func addViews() {
    view.addSubview(collectionView)
  }
  
  private func setConstraints() {
    collectionViewConstraints()
  }
  
  private func configureCollectionView() {
    collectionView.register(PostCell.self, forCellWithReuseIdentifier: postCellId)
    collectionView.dataSource = self
    collectionView.delegate = self
  }
  
  // MARK: - Constraints
  private func collectionViewConstraints() {
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.92).isActive = true
    collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 45).isActive = true
  }
}

extension PostViewController:
  UICollectionViewDelegateFlowLayout,
  UICollectionViewDelegate,
  UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    <#code#>
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    <#code#>
  }
}
