//
//  FirstViewController.swift
//  PresentHierarchy
//
//  Created by Junhyeong Hong on 2022/08/07.
//

import Foundation

class FirstViewController: BaseViewController<SecondViewController> {
    override func viewDidLoad() {
        super.viewDidLoad()
        // To show SecondViewController from FirstViewController, try below line
        // self.definesPresentationContext = true
        
        view.backgroundColor = .red
    }
}
