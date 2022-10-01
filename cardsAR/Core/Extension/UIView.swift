//
//  UIView.swift
//  cardsAR
//
//  Created by Swift Learning on 30.09.2022.
//

import UIKit

extension UIView {
    
    func myAddSubview(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            myAddSubview(view)
        }
    }
}
