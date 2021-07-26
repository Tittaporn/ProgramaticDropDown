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
    let dropDown = DropDown()
    let testExtensionDropDown = DropDown()
    let testArray = ["test1","test2","test3","test4","test1","test2","test3","test4","test1","test2","test3","test4","test1","test2","test3","test4","test1","test2","test3","test4","test1","test2","test3","test4","test1","test2","test3","test4","test1","test2","test3","test4"]
    let testExtensionDataSource = ["Lee", "Donny", "Lyn", "New", "Night"]
    var dataSource: [String] = [] {
        didSet {
            updateDropDownDataSource(with: dropDown, dataSource: dataSource)
            updateDropDownDataSource(with: testExtensionDropDown, dataSource: dataSource)
            
        }
    }
    
    // MARK: - Life Cycle Methods
    override func loadView() {
        super.loadView()
        addAllSubView()
        contraintAllSubViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activateDropDownButton()
        //        dropDown.anchorView = vwDropDown
        //        dropDown.dataSource = testArray
        //        dropDown.bottomOffset = CGPoint(x: 0, y: (dropDown.anchorView?.plainView.bounds.height)!)
        //        dropDown.topOffset = CGPoint(x: 0, y: (dropDown.anchorView?.plainView.bounds.height)!)
        //        dropDown.direction = .bottom
        //        dropDown.selectionAction = { (index: Int, item: String) in
        //            print("\n===================Selected item : \(item) at index : \(index) IN \(#function) ======================\n")
        //            self.textLabel.text = self.testArray[index]
        //            self.testTextField.text = self.testArray[index]
        //        }
        testExtensionactivateDropDownButton()
        setupDropDown(with: testExtensionDropDown, textField: testExtensionTextField)
        setupDropDown(with: dropDown, textField: testTextField)
        
    }
    
    // MARK: - Helper Fuctions
    func addAllSubView() {
        // self.view.addSubview(vwDropDown)
        self.view.addSubview(textLabel)
        self.view.addSubview(dropDownButton)
        self.view.addSubview(testTextField)
        self.view.addSubview(testExtensionTextField)
        self.view.addSubview(testExtensionDropDownButton)
    }
    
    // Using Extension UIView ==> anchor() ==> to contraint the subViews
    func contraintAllSubViews() {
        textLabel.anchor(top: safeArea.topAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 30, paddingBottom: 16, paddingLeft: 16, paddingRight: 16)
        dropDownButton.anchor(top: textLabel.bottomAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 30, paddingBottom: 0, paddingLeft: 16, paddingRight: 16)
        testTextField.anchor(top: dropDownButton.bottomAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 0, paddingBottom: 16, paddingLeft: 16, paddingRight: 16)
        //vwDropDown.anchor(top: testTextField.bottomAnchor, bottom: nil, leading: testTextField.leadingAnchor, trailing: testTextField.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0)
        testExtensionTextField.anchor(top: testTextField.bottomAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 16, paddingBottom: 16, paddingLeft: 16, paddingRight: 16)
        testExtensionDropDownButton.anchor(top: testExtensionTextField.bottomAnchor, bottom: nil, leading: testExtensionTextField.leadingAnchor, trailing: testExtensionTextField.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0)
    }
    
    func  testExtensionactivateDropDownButton() {
        self.testExtensionDropDownButton.addTarget(self, action: #selector(testExtensiondropDownButtonTapped(sender:)), for: .touchUpInside)
    }
    
    func activateDropDownButton() {
        self.dropDownButton.addTarget(self, action: #selector(dropDownButtonTapped(sender:)), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc func dropDownButtonTapped(sender: UIButton){
        print("\n=================== DropDown Button Tapped IN \(#function) ======================\n")
        dataSource = testArray
        dropDown.show()
        updateTextFieldWithDropDownSelection(with: dropDown, dataSource: dataSource, textField: testTextField)
    }
    
    @objc func  testExtensiondropDownButtonTapped(sender: UIButton){
        print("\n=================== testExtensiondropDownButtonTapped Button Tapped IN \(#function) ======================\n")
        //testExtensionDropDown.show()
        dataSource = testExtensionDataSource
        testExtensionDropDown.show()
        updateTextFieldWithDropDownSelection(with: testExtensionDropDown, dataSource: dataSource, textField: testExtensionTextField)
    }
    
    // MARK: - Views
    //    let vwDropDown: UIView = {
    //        let view = UIView()
    //        view.backgroundColor = .red
    //        return view
    //    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello World ! Programatic DropDrop..."
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
    
    let testExtensionDropDownButton: UIButton = {
        let button = UIButton()
        button.setTitle("Extension Drop Down", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    let testExtensionTextField: UITextField = {
        let textField = UITextField()
        textField.text = "Extension Text Field"
        textField.backgroundColor = .yellow
        return textField
    }()
}

