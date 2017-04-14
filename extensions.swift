//
//  helper.swift
//  mytube
//
//  Created by PhongLe on 4/8/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit


extension UIColor {
    static func makeRBG(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
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
