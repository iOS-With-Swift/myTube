//
//  VideoCell.swift
//  mytube
//
//  Created by PhongLe on 4/8/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit
class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView(){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class VideoCell: BaseCell {
    
    let thumbnailImageView: UIImageView = { () -> UIImageView in
        let imageView = UIImageView()
        imageView.image = UIImage(named: "thumbnailMTP")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let separatorView: UIView = { () ->UIView in
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return  view
    }()
    
    let userProfileImageView: UIImageView = {
        () ->UIImageView in
        let imageView = UIImageView()
        imageView.image = UIImage(named: "userProfile")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        () ->UILabel in
        let titleLable = UILabel()
        titleLable.text = "Nơi này có anh -  Sơn Thùng SơnTiVi"
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        return titleLable
    }()
    
    let subTitleLabel: UITextView = {
        () ->UITextView in
        let subTitleLable = UITextView()
        subTitleLable.text = "Sơn Tùng Official"
        subTitleLable.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        subTitleLable.textColor = UIColor.lightGray
        subTitleLable.translatesAutoresizingMaskIntoConstraints = false
        return subTitleLable
    }()
    
    override func setupView(){
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
}
