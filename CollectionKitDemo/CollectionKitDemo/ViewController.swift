//
//  ViewController.swift
//  CollectionKitDemo
//
//  Created by LiSen on 2017/12/21.
//  Copyright © 2017年 LiSen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate lazy var collectionView: CollectionView = {
        let collectionV: CollectionView = CollectionView()
        collectionV.translatesAutoresizingMaskIntoConstraints = false
        return collectionV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initContentViews()
        singleProvider()
    }
    
    // MARK: private methods
    fileprivate func initContentViews() {
//        let guide = view.layoutMarginsGuide
        view.backgroundColor = UIColor.white
        collectionView.frame = view.bounds
        collectionView.contentInset = UIEdgeInsets(top: 40.0, left: 10.0, bottom: 10.0, right: 0.0)
        view.addSubview(collectionView)
//        collectionView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10.0).isActive = true
//        collectionView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
//        collectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
//        collectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    }
    
    fileprivate func singleProvider() {
        let provider: CollectionProvider<Int, UILabel> = CollectionProvider(data: [1, 2, 3, 4, 5], viewUpdater: { (label: UILabel, index: Int, data: Int) in
            label.backgroundColor = UIColor.brown
            label.textColor = UIColor.white
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textAlignment = .center
            label.text = "\(data)"
        }, sizeProvider: { (index: Int, data: Int, collectionSize: CGSize) -> CGSize in
            return CGSize(width: 80.0, height: 30.0)
        })
        
        collectionView.provider = provider
    }
    
}

