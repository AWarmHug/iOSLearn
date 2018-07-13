//
//  ViewController.swift
//  UICollectionViewDemo
//
//  Created by Warm-mac on 2018/6/30.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{

    var name = [String]()
    

    lazy var collection :UICollectionView={
        let collection=UICollectionView()
        let collectionLayout=UICollectionViewFlowLayout()
        collectionLayout.minimumInteritemSpacing=15
        collectionLayout.minimumLineSpacing=30
        collectionLayout.sectionInset=UIEdgeInsetsMake(10, 10, 10, 10)
        collection.dataSource=self
        collection.delegate=self
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collection)
        
        for item in 0..<20{
            name[item]="张三\(item)"
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class ItemCell: UICollectionViewCell {

    lazy var label : UILabel={
        let label=UILabel()
        label.textColor=UIColor.black
        return label
    }()
    
    override init(frame: CGRect) {
        addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

