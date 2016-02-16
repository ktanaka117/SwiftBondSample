//
//  ViewController.swift
//  SwiftBondSample
//
//  Created by 田中賢治 on 2016/02/13.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: - Observing
        // Observing to change textField.bnd_text
        textField.bnd_text.observe { event in
            print("textField: \(event)")
        }
        
        // Observing to change viewModel.text
        viewModel.text.observe { event in
            print("viewModel: \(event)")
        }
        
        // Observing to change label.bnd_text
        label.bnd_text.observe { event in
            print("label: \(event)")
        }
        
        
        
        // MARK: - Binding
        // Binding textField to label via viewModel.
        textField.bnd_text.bindTo(viewModel.text)
        viewModel.text.bindTo(label.bnd_text)
        
        
        
        // When you want to process string, you do that before binding.
//        textField.bnd_text
//            .map { text in return "I want \(text!)" }
//            .bindTo(viewModel.text)
//        viewModel.text.bindTo(label.bnd_text)
        
        // Other Binding pattern
//        textField.bnd_text
//            .reduce("I want") { $0 + " " + $1! }.bindTo(viewModel.text)
//        viewModel.text.bindTo(label.bnd_text)
        
        
        
        // MARK: - Bidirectional Binding
        // Binding textField and label each other.
//        textField.bnd_text.bidirectionalBindTo(label.bnd_text)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // Checking Bidirectional Binding
//        label.bnd_text.value = "hoge"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

