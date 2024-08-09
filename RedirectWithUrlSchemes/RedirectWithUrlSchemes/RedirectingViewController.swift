//
//  RedirectingViewController.swift
//  AppSwitchWithURLSchemes
//
//  Created by Rong Sun on 8/8/24.
//

import UIKit

class RedirectingViewController: UIViewController {
  
  lazy var googleButton: UIButton = {
    let button = UIButton(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
    button.backgroundColor = .systemBlue
    button.setTitle("Google", for: .normal)
    button.addTarget(self, action: #selector(pressGoogleButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  lazy var shortcutsButton: UIButton = {
    let button = UIButton(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
    button.backgroundColor = .systemPink
    button.setTitle("FaceTime", for: .normal)
    button.addTarget(self, action: #selector(pressFacetimeButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    self.title = "App Redirection Demo"
    
    view.addSubview(googleButton)
    NSLayoutConstraint.activate([
      googleButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -15),
      googleButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      googleButton.heightAnchor.constraint(equalToConstant: 30),
      googleButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 30),
      googleButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -30),
    ])
    
    view.addSubview(shortcutsButton)
    NSLayoutConstraint.activate([
      shortcutsButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 15),
      shortcutsButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      shortcutsButton.heightAnchor.constraint(equalToConstant: 30),
      shortcutsButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 30),
      shortcutsButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -30),
    ])
  }
  
  @objc private func pressGoogleButton() {
    redirectToGoogleBrowser()
  }
  
  @objc private func pressFacetimeButton() {
    redirectToFacetime()
  }
  
  private func redirectToGoogleBrowser() {
    guard let url = URL(string: "http://www.google.com") else {
      return //be safe
    }

    if #available(iOS 10.0, *) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    } else {
        UIApplication.shared.openURL(url)
    }
  }
  
  private func redirectToFacetime() {
    guard let url = URL(string: "shortcuts://") else {
      return //be safe
    }

    if #available(iOS 10.0, *) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    } else {
        UIApplication.shared.openURL(url)
    }  }
  
  private func redirectToUrl() {
    let url = URL(string: "urlschemesexample://")
    
    UIApplication.shared.open(url!) { (result) in
      if result {
        NSLog("Redirected to browser.")
      }
    }
  }
}

