//
//  SecondViewController.swift
//  PresentHierarchy
//
//  Created by Junhyeong Hong on 2022/08/07.
//

import Foundation

class SecondViewController: BaseViewController<ThirdViewController> {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}
