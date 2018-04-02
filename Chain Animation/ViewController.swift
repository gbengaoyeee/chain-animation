//
//  ViewController.swift
//  Chain Animation
//
//  Created by Gbenga Ayobami on 2018-04-01.
//  Copyright © 2018 Gbenga Ayobami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //setup UI
    let titleLabel = UILabel()
    let bodyLabel = UILabel()
    fileprivate func setupLabels() {
        titleLabel.numberOfLines = 0
        titleLabel.text = "Welcome to my company"
        titleLabel.font = UIFont(name: "Futura", size: 34)
        bodyLabel.numberOfLines = 0
        bodyLabel.text = "Thank you for downloading our brand new app from the app store and please take you time to give us a nice juicy review"
    }
    
    fileprivate func setupStackViewNConstraints() {
        let stackview = UIStackView(arrangedSubviews: [titleLabel, bodyLabel])
        stackview.axis = .vertical //because it defaults to horizontal
        stackview.spacing = 30
        view.addSubview(stackview)
        //enables Auto layout
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackview.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackview.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
        setupStackViewNConstraints()
        
        //fun animations
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimation)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @objc fileprivate func handleTapAnimation(){
        print("Animating")
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.titleLabel.alpha = 0
                self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -250)
            }, completion: nil)
        }
        
        //body animation
        UIView.animate(withDuration: 0.8, delay: 0.3, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.bodyLabel.alpha = 0
                self.bodyLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -250)
            }, completion: nil)
        }
    }
}












