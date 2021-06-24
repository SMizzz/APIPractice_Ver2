//
//  MovieDetailViewController.swift
//  APIPractice
//
//  Created by 신미지 on 2021/06/24.
//

import UIKit

class MovieDetailViewController: UIViewController {
  // MARK: - Properties
  let topView = MovieTopView()
  let detailView = MovieDetailView()
  
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
    topView.logoImageView.isHidden = true
    topView.logoTitleLabel.isHidden = true
    topView.recentTitleLabel.isHidden = true
    topView.backButton.isHidden = false
    configureButton()
  }
  
  private func addViews() {
    view.addSubview(detailView)
    view.addSubview(topView)
  }
  
  private func setConstraints() {
    detailViewConstraints()
    topViewConstraints()
  }
  
  private func configureButton() {
    topView.backButton.addTarget(
      self,
      action: #selector(handleBackButton),
      for: .touchUpInside)
  }
  
  @objc func handleBackButton() {
    navigationController?.popViewController(animated: true)
  }
  
  // MARK: - Constraints
  private func detailViewConstraints() {
    detailView.translatesAutoresizingMaskIntoConstraints = false
    detailView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    detailView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    detailView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    detailView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  }
  
  private func topViewConstraints() {
    topView.translatesAutoresizingMaskIntoConstraints = false
    topView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    topView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    topView.topAnchor.constraint(equalTo: view.topAnchor,constant: 45).isActive = true
    topView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  }
}
