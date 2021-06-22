//
//  PostCell.swift
//  APIPractice
//
//  Created by 신미지 on 2021/06/22.
//

import UIKit

class PostCell: UICollectionViewCell {
  // MARK: - Properties
  let userIDLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.textColor = .black
    label.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
    label.layer.masksToBounds = true
    label.layer.cornerRadius = 30
    label.layer.borderWidth = 2
    label.layer.borderColor = UIColor.white.cgColor
    return label
  }()
  
  let postIdLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.textColor = .black
    return label
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.font = UIFont.boldSystemFont(ofSize: 18)
    label.lineBreakMode = .byWordWrapping
    label.textColor = .black
    label.numberOfLines = 0
//    label.backgroundColor = .green
    return label
  }()
  
  let bodyContentLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.textColor = .black
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
//    label.backgroundColor = .systemPink
    label.font = UIFont.systemFont(ofSize: 17)
    return label
  }()
  
  let lineView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
    return view
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
    addSubview(userIDLabel)
    addSubview(postIdLabel)
    addSubview(titleLabel)
    addSubview(bodyContentLabel)
    addSubview(lineView)
  }
  
  private func setConstraints() {
    userIDLabelConstraints()
    postIdLabelConstraints()
    titleLabelConstraints()
    bodyContentLabelConstraints()
    lineViewConstraints()
  }
  
  // MARK: - Constraints
  private func userIDLabelConstraints() {
    userIDLabel.translatesAutoresizingMaskIntoConstraints = false
    userIDLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
    userIDLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
    userIDLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    userIDLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
  }
  
  private func postIdLabelConstraints() {
    postIdLabel.translatesAutoresizingMaskIntoConstraints = false
    postIdLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
    postIdLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    postIdLabel.centerYAnchor.constraint(equalTo: userIDLabel.centerYAnchor).isActive = true
    postIdLabel.leadingAnchor.constraint(equalTo: userIDLabel.leadingAnchor, constant: 70).isActive = true
  }
  
  private func titleLabelConstraints() {
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
    titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    titleLabel.topAnchor.constraint(equalTo: postIdLabel.bottomAnchor, constant: 15).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: postIdLabel.leadingAnchor).isActive = true
  }
  
  private func bodyContentLabelConstraints() {
    bodyContentLabel.translatesAutoresizingMaskIntoConstraints = false
    bodyContentLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
    bodyContentLabel.heightAnchor.constraint(equalToConstant: 160).isActive = true
    bodyContentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
    bodyContentLabel.leadingAnchor.constraint(equalTo: postIdLabel.leadingAnchor).isActive = true
  }
  
  private func lineViewConstraints() {
    lineView.translatesAutoresizingMaskIntoConstraints = false
    lineView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
    lineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
    lineView.topAnchor.constraint(equalTo: bodyContentLabel.bottomAnchor, constant: 17).isActive = true
    lineView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
  }
}
