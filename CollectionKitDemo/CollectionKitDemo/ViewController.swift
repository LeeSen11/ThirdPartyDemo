//
//  ViewController.swift
//  CollectionKitDemo
//
//  Created by LiSen on 2017/12/21.
//  Copyright © 2017年 LiSen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    fileprivate lazy var collectionView: CollectionView = {
//        let collectionV: CollectionView = CollectionView()
//        return collectionV
//    }()
    
    let collectionView: CollectionView = CollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initContentViews()
        singleProvider()
    }
    
    // MARK: private methods
    fileprivate func initContentViews() {
        view.backgroundColor = UIColor.white
        collectionView.frame = view.bounds
        collectionView.contentInset = UIEdgeInsets(top: 40.0, left: 10.0, bottom: 0.0, right: 10.0)
        view.addSubview(collectionView)
    }
    
    fileprivate func singleProvider() {
        let provider: CollectionProvider<Int, UILabel> = CollectionProvider(data: [1, 2, 3, 4, 5], viewUpdater: { (label: UILabel, index: Int, data: Int) in
            label.backgroundColor = UIColor.brown
            label.textColor = UIColor.white
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textAlignment = .center
            label.text = "\(data)"
        }, sizeProvider: { (index: Int, data: Int, collectionSize: CGSize) -> CGSize in
            
            return CGSize(width: (UIScreen.main.bounds.width - 50.0) / 4.0, height: 30.0)
        })
        
        //justifyContent: 调整item在每行中的显示样式
        //alignContent: 调整所有的item的显示位置
        provider.layout = FlowLayout(lineSpacing: 5.0, interitemSpacing: 10.0, justifyContent: JustifyContent.end, alignItems: AlignItem.start, alignContent: AlignContent.start) //FlowLayout(spacing: 10.0)
        /**
         根据文档中的说明, 一共存在FlowLayout, WaterfallLayout, RowLayout, InsetLayout, TransposeLayout几种布局样式
         
         */
        collectionView.provider = provider
    }
    
}

