//
//  MovieCell.swift
//  APIPractice
//
//  Created by 신미지 on 2021/06/24.
//

import UIKit

protocol MovieToDetailVCDelegate: AnyObject {
  func cellDelegate(cell: MovieCell)
}

class MovieCell: UICollectionViewCell {
  // MARK: - Properties
  weak var delegate: MovieToDetailVCDelegate?
  
  let movieThumbnailImageView: UIImageView = {
    let iv = UIImageView()
    var image = UIImage()
    iv.image = image
    iv.clipsToBounds = true
    iv.layer.cornerRadius = 30
    iv.contentMode = .scaleAspectFill
    iv.backgroundColor = .green
    return iv
  }()
  
  let movieNameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 19)
    label.textAlignment = .left
    return label
  }()
  
  let averageCountLabel: UILabel = {
    let label = UILabel()
    label.textColor = .darkGray
    label.font = UIFont.boldSystemFont(ofSize: 18)
    label.textAlignment = .left
    return label
  }()
  
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
    addViews()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Handlers
  private func setup() {
    backgroundColor = .white
    configureGestureRecognizer()
  }
  
  private func addViews() {
    addSubview(movieThumbnailImageView)
    addSubview(movieNameLabel)
    addSubview(averageCountLabel)
  }
  
  private func setConstraints() {
    movieThumbnailImageViewConstraints()
    movieNameLabelConstraints()
    averageCountLabelConstraints()
  }
  
  private func configureGestureRecognizer() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(handleGRImageView))
    movieThumbnailImageView.addGestureRecognizer(tap)
    movieThumbnailImageView.isUserInteractionEnabled = true
  }
  
  @objc func handleGRImageView() {
    delegate?.cellDelegate(cell: self)
  }
  
  // MARK: - Constraints
  private func movieThumbnailImageViewConstraints() {
    movieThumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
    movieThumbnailImageView.widthAnchor.constraint(equalToConstant: 330).isActive = true
    movieThumbnailImageView.heightAnchor.constraint(equalToConstant: 450).isActive = true
    movieThumbnailImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    movieThumbnailImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
  }
  
  private func movieNameLabelConstraints() {
    movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
    movieNameLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    movieNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    movieNameLabel.topAnchor.constraint(equalTo: movieThumbnailImageView.bottomAnchor, constant: 10).isActive = true
    movieNameLabel.leadingAnchor.constraint(equalTo: movieThumbnailImageView.leadingAnchor).isActive = true
  }
  
  private func averageCountLabelConstraints() {
    averageCountLabel.translatesAutoresizingMaskIntoConstraints = false
    averageCountLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    averageCountLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    averageCountLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 10).isActive = true
    averageCountLabel.leadingAnchor.constraint(equalTo: movieNameLabel.leadingAnchor).isActive = true
  }
}
