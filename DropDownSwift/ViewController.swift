//
//  ViewController.swift
//  DropDownSwift
//
//  Created by Lee on 7/24/21.
//

import UIKit
import DropDown

class ViewController: UIViewController {
    
    // MARK: - Properties
    var safeArea: UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }
    
    let drowDown = DropDown()
    let testArray = ["test1","test2","test3","test4","test1","test2","test3","test4","test1","test2","test3","test4","test1","test2","test3","test4","test1","test2","test3","test4","test1","test2","test3","test4","test1","test2","test3","test4","test1","test2","test3","test4"]
    
    // MARK: - Life Cycle Methods
    override func loadView() {
        super.loadView()
        addAllSubView()
        contraintAllSubViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activateDropDownButton()
        drowDown.anchorView = vwDropDown
        drowDown.dataSource = testArray
        drowDown.bottomOffset = CGPoint(x: 0, y: (drowDown.anchorView?.plainView.bounds.height)!)
        drowDown.topOffset = CGPoint(x: 0, y: (drowDown.anchorView?.plainView.bounds.height)!)
        drowDown.direction = .bottom
        drowDown.selectionAction = { (index: Int, item: String) in
            print("\n===================Selected item : \(item) at index : \(index) IN \(#function) ======================\n")
            self.textLabel.text = self.testArray[index]
            self.testTextField.text = self.testArray[index]
        }
        
    }
    
    // MARK: - Helper Fuctions
    func addAllSubView() {
        self.view.addSubview(vwDropDown)
        self.view.addSubview(textLabel)
        self.view.addSubview(dropDownButton)
        self.view.addSubview(testTextField)
    }
    
    // Using Extension UIView ==> anchor() ==> to contraint the subViews
    func contraintAllSubViews() {
        textLabel.anchor(top: safeArea.topAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 30, paddingBottom: 16, paddingLeft: 16, paddingRight: 16)
        dropDownButton.anchor(top: textLabel.bottomAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 30, paddingBottom: 0, paddingLeft: 16, paddingRight: 16)
        testTextField.anchor(top: dropDownButton.bottomAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 0, paddingBottom: 16, paddingLeft: 16, paddingRight: 16)
        vwDropDown.anchor(top: testTextField.bottomAnchor, bottom: nil, leading: testTextField.leadingAnchor, trailing: testTextField.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0)
        
    }
    
    @objc func dropDownButtonTapped(sender: UIButton){
        print("\n=================== DropDown Button Tapped IN \(#function) ======================\n")
        drowDown.show()
    }
     
     func activateDropDownButton() {
         self.dropDownButton.addTarget(self, action: #selector(dropDownButtonTapped(sender:)), for: .touchUpInside)
     }
    
    // MARK: - Views
    let vwDropDown: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello World"
        return label
    }()
    
    let dropDownButton: UIButton = {
        let button = UIButton()
        button.setTitle("Drop Down", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    let testTextField: UITextField = {
        let textField = UITextField()
        textField.text = "Test Text Field"
        textField.backgroundColor = .yellow
        return textField
    }()
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

