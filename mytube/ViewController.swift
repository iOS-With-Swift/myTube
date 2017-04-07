//
//  ViewController.swift
//  mytube
//
//  Created by PhongLe on 4/7/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:view.frame.width, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}



class VideoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    let thumbnailImageView: UIImageView = { () -> UIImageView in
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        return imageView
    }()
    
    let separatorView: UIView = { () ->UIView in
        let view = UIView()
        view.backgroundColor = UIColor.gray
        return  view
    }()
    
    let userProfileImageView: UIImageView = {
        () ->UIImageView in
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.green
        return imageView
    }()
    
    let titleLabel: UILabel = {
        () ->UILabel in
        let titleLable = UILabel()
        titleLable.backgroundColor = UIColor.purple
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        return titleLable
    }()
    
    let subTitleLabel: UILabel = {
        () ->UILabel in
        let subTitleLable = UILabel()
        subTitleLable.backgroundColor = UIColor.purple
        subTitleLable.translatesAutoresizingMaskIntoConstraints = false
        return subTitleLable
    }()

    func setupView(){
        //add sub view
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        
        //add constrains
        
            //horizoltal constrains
        addConstrainsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstrainsWithFormat(format: "H:|-16-[v0(44)]|", views: userProfileImageView)
        
            //vertical constrains
        addConstrainsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, userProfileImageView , separatorView)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[v1]-5-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1": separatorView]))
        addConstrainsWithFormat(format: "H:|-5-[v0]-5-|", views: separatorView)
        
        //Title contrains
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        //sub title contrains
        addConstraint(NSLayoutConstraint(item: subTitleLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        addConstraint(NSLayoutConstraint(item: subTitleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: subTitleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: subTitleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIView{
    func addConstrainsWithFormat (format: String, views: UIView...){
        var viewsDict = [String : UIView]()
        for (index,view)in views.enumerated() {
            let key = "v\(index)"
            viewsDict[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict))
    }
}
