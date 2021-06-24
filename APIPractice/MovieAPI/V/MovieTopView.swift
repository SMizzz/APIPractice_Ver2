//
//  MovieTopView.swift
//  APIPractice
//
//  Created by 신미지 on 2021/06/24.
//

import UIKit

class MovieTopView: UIView {
  // MARK: - Properties
  let logoImageView: UIImageView = {
    let iv = UIImageView()
    var image = UIImage(named: "movie")
    iv.image = image
    return iv
  }()
  
  let logoTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "Show Box"
    label.textAlignment = .left
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 20)
    return label
  }()
  
  let recentTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "Recent"
    label.textAlignment = .left
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 19)
    return label
  }()
  
  let backButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "back"), for: .normal)
    return button
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
    backgroundColor = .clear
    
    backButton.isHidden = true
  }
  
  private func addViews() {
    addSubview(logoImageView)
    addSubview(logoTitleLabel)
    addSubview(recentTitleLabel)
    addSubview(backButton)
  }
  
  private func setConstraints() {
    logoImageViewConstraints()
    logoTitleLabelConstraints()
    recentTitleLabelConstraints()
    backButtonConstraints()
  }
  
  // MARK: - Constraints
  private func logoImageViewConstraints() {
    logoImageView.translatesAutoresizingMaskIntoConstraints = false
    logoImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
    logoImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    logoImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
  }
  
  private func logoTitleLabelConstraints() {
    logoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    logoTitleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    logoTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    logoTitleLabel.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor).isActive = true
    logoTitleLabel.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor, constant: 50).isActive = true
  }
  
  private func recentTitleLabelConstraints() {
    recentTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    recentTitleLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
    recentTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    recentTitleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 25).isActive = true
    recentTitleLabel.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor).isActive = true
  }
  
  private func backButtonConstraints() {
    backButton.translatesAutoresizingMaskIntoConstraints = false
    backButton.widthAnchor.constraint(equalToConstant: 27).isActive = true
    backButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
    backButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
  }
}
