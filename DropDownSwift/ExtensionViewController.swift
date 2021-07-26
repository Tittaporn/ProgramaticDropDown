//
//  ExtensionViewController.swift
//  DropDownSwift
//
//  Created by Lee on 7/25/21.
//

import Foundation
import UIKit
import DropDown

extension UIViewController {
    
    func setupDropDown(with dropDown: DropDown, textField: UITextField) {
        let vwDropDown: UIView = {
            let view = UIView()
            view.backgroundColor = .red
            return view
        }()
        self.view.addSubview(vwDropDown)
        vwDropDown.anchor(top: textField.bottomAnchor, bottom: nil, leading: textField.leadingAnchor, trailing: textField.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0)
        dropDown.anchorView = vwDropDown
        dropDown.bottomOffset = CGPoint(x: 0, y: (dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y: (dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.direction = .bottom
    }
    
    func updateDropDownDataSource(with dropDown: DropDown, dataSource: [String]) {
        dropDown.dataSource = dataSource
    }
    
    func updateTextFieldWithDropDownSelection(with dropDown: DropDown, dataSource: [String], textField: UITextField) {
        dropDown.selectionAction = { (index: Int, item: String) in
            print("\n===================Selected item : \(item) at index : \(index) IN \(#function) ======================\n")
            textField.text = dataSource[index]
        }
    }
}

// MARK: - Anchor
extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingBottom: CGFloat, paddingLeft: CGFloat, paddingRight: CGFloat, width: CGFloat? = nil, height: CGFloat? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -paddingRight).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

