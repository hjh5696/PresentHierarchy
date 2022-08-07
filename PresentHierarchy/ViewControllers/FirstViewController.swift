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
        view.backgroundColor = .red
    }
}
