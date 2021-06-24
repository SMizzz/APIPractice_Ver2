//
//  NewsCell.swift
//  APIPractice
//
//  Created by 신미지 on 2021/06/23.
//

import UIKit

class NewsCell: UICollectionViewCell {
  // MARK: - Properties
  let thumbNailImageView: UIImageView = {
    let iv = UIImageView()
    var image = UIImage()
    iv.image = image
    iv.clipsToBounds = true
    iv.contentMode = .scaleAspectFill
    return iv
  }()

  let titleLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.textColor = .black
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.font = UIFont.boldSystemFont(ofSize: 17)
    return label
  }()
  
  let lineView: UIView = {
    let view = UIView()
    view.backgroundColor = .gray
    return view
  }()
  
  let authorLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 17)
    return label
  }()
  
  let contentLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.textColor = .darkGray
    label.font = UIFont.boldSystemFont(ofSize: 15)
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.sizeToFit()
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
    addSubview(thumbNailImageView)
    addSubview(titleLabel)
    addSubview(lineView)
    addSubview(authorLabel)
    addSubview(contentLabel)
  }
  
  private func setConstraints() {
    thumbNailImageViewConstraints()
    titleLabelConstraints()
    lineViewConstraints()
    authorLabelConstraints()
    contentLabelConstraints()
  }
  
  // MARK: - Constraints
  private func thumbNailImageViewConstraints() {
    thumbNailImageView.translatesAutoresizingMaskIntoConstraints = false
    thumbNailImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.93).isActive = true
    thumbNailImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    thumbNailImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    thumbNailImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
  }
  
  private func titleLabelConstraints() {
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.93).isActive = true
    titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    titleLabel.topAnchor.constraint(equalTo: thumbNailImageView.bottomAnchor, constant: 10).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: thumbNailImageView.leadingAnchor).isActive = true
  }
  
  private func lineViewConstraints() {
    lineView.translatesAutoresizingMaskIntoConstraints = false
    lineView.widthAnchor.constraint(equalToConstant: 350).isActive = true
    lineView.heightAnchor.constraint(equalToConstant: 3).isActive = true
    lineView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
    lineView.leadingAnchor.constraint(equalTo: thumbNailImageView.leadingAnchor).isActive = true
  }
  
  private func authorLabelConstraints() {
    authorLabel.translatesAutoresizingMaskIntoConstraints = false
    authorLabel.widthAnchor.constraint(equalToConstant: 350).isActive = true
    authorLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    authorLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 10).isActive = true
    authorLabel.leadingAnchor.constraint(equalTo: thumbNailImageView.leadingAnchor).isActive = true
  }
  
  private func contentLabelConstraints() {
    contentLabel.translatesAutoresizingMaskIntoConstraints = false
    contentLabel.widthAnchor.constraint(equalToConstant: 350).isActive = true
    contentLabel.heightAnchor.constraint(equalToConstant: 120).isActive = true
    contentLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 10).isActive = true
    contentLabel.leadingAnchor.constraint(equalTo: thumbNailImageView.leadingAnchor).isActive = true
  }
}
