//
//  MovieDetailView.swift
//  APIPractice
//
//  Created by 신미지 on 2021/06/24.
//

import UIKit

class MovieDetailView: UIView {
  // MARK: - Properties
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
    label.font = UIFont.boldSystemFont(ofSize: 25)
    label.textAlignment = .left
    return label
  }()
  
  let averageCountLabel: UILabel = {
    let label = UILabel()
    label.textColor = .lightGray
    label.font = UIFont.boldSystemFont(ofSize: 22)
    label.textAlignment = .left
    return label
  }()
  
  let overviewLabel: UILabel = {
    let label = UILabel()
    label.textColor = .darkGray
    label.font = UIFont.boldSystemFont(ofSize: 20)
    label.textAlignment = .left
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
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
  }
  
  private func addViews() {
    addSubview(movieThumbnailImageView)
    addSubview(movieNameLabel)
    addSubview(averageCountLabel)
    addSubview(overviewLabel)
  }
  
  private func setConstraints() {
    movieThumbnailImageViewConstraints()
    movieNameLabelConstraints()
    averageCountLabelConstraints()
    overviewLabelConstraints()
  }
  
  // MARK: - Constraints
  private func movieThumbnailImageViewConstraints() {
    movieThumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
    movieThumbnailImageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    movieThumbnailImageView.heightAnchor.constraint(equalToConstant: 600).isActive = true
    movieThumbnailImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    movieThumbnailImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
  }
  
  private func movieNameLabelConstraints() {
    movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
    movieNameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
    movieNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    movieNameLabel.topAnchor.constraint(equalTo: movieThumbnailImageView.bottomAnchor, constant: 15).isActive = true
    movieNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
  }
  
  private func averageCountLabelConstraints() {
    averageCountLabel.translatesAutoresizingMaskIntoConstraints = false
    averageCountLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
    averageCountLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    averageCountLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 5).isActive = true
    averageCountLabel.leadingAnchor.constraint(equalTo: movieNameLabel.leadingAnchor).isActive = true
  }
  
  private func overviewLabelConstraints() {
    overviewLabel.translatesAutoresizingMaskIntoConstraints = false
    overviewLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
    overviewLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
    overviewLabel.topAnchor.constraint(equalTo: averageCountLabel.bottomAnchor, constant: 20).isActive = true
    overviewLabel.leadingAnchor.constraint(equalTo: movieNameLabel.leadingAnchor).isActive = true
  }
}
