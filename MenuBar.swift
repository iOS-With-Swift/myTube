//
//  MenuBar.swift
//  mytube
//
//  Created by PhongLe on 4/11/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    lazy var collectionView: UICollectionView = { () -> UICollectionView in
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.makeRBG(red: 230, green: 32, blue: 31)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "cellId"
    let imageTop = ["home", "trending", "subscriptions", "account"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addConstrainsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstrainsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        let selectIndexPath = NSIndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectIndexPath as IndexPath, animated: false, scrollPosition: .bottom)
        
        backgroundColor = UIColor.makeRBG(red: 230, green: 32, blue: 31)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        
        cell.imageView.image = UIImage(named: imageTop[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor.makeRBG(red: 91, green: 14, blue: 13)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/4, height: frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MenuCell: BaseCell{
    let imageView: UIImageView = {
        ()-> UIImageView in
        let iv = UIImageView()
        iv.image = UIImage(named: "subscriptions")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor.makeRBG(red: 91, green: 14, blue: 13)
        return iv
    }()
    
//    override var isHighlighted: Bool {
//        didSet{
//            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.makeRBG(red: 91, green: 14, blue: 13)
//        }
//    }
    override var isSelected: Bool {
        didSet{
            imageView.tintColor = isSelected ? UIColor.white : UIColor.makeRBG(red: 91, green: 14, blue: 13)
        }
    }
    override func setupView() {
        super.setupView()
        
        addSubview(imageView)
        addConstrainsWithFormat(format: "H:[v0(28)]", views: imageView)
        addConstrainsWithFormat(format: "V:[v0(28)]", views: imageView)
        
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}





