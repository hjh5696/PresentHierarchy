//
//  ViewController.swift
//  PresentHierarchy
//
//  Created by Junhyeong Hong on 2022/08/07.
//

import UIKit

class BaseViewController<T: UIViewController>: UIViewController {
    
    let classNameLabel = UILabel()
    
    let presentingVCLabel = UILabel()
    
    let modalPresentationStyleLabel = UILabel()
    
    let definesPresentationContextLabel = UILabel()
    
    let presentFullScreenButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Present fullScreen", for: .normal)
        btn.backgroundColor = .gray
        btn.layer.cornerRadius = 4
        return btn
    }()
    
    let presentCurrentContextButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Present currentContext", for: .normal)
        btn.backgroundColor = .gray
        btn.layer.cornerRadius = 4
        return btn
    }()
    
    let presentPageSheetButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Present pageSheet", for: .normal)
        btn.backgroundColor = .gray
        btn.layer.cornerRadius = 4
        return btn
    }()
    
    let presentPopoverButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Present Popover", for: .normal)
        btn.backgroundColor = .gray
        btn.layer.cornerRadius = 4
        return btn
    }()
    let pushButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Push", for: .normal)
        btn.backgroundColor = .gray
        btn.layer.cornerRadius = 4
        return btn
    }()
    
    let dismissButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Dismiss", for: .normal)
        btn.backgroundColor = .gray
        btn.layer.cornerRadius = 4
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        let buttons = UIStackView(arrangedSubviews: [
            presentFullScreenButton,
            presentCurrentContextButton,
            presentPageSheetButton,
            presentPopoverButton,
            pushButton,
            dismissButton
        ])
        
        buttons.spacing = 10
        buttons.axis = .vertical
        
        classNameLabel.translatesAutoresizingMaskIntoConstraints = false
        presentingVCLabel.translatesAutoresizingMaskIntoConstraints = false
        modalPresentationStyleLabel.translatesAutoresizingMaskIntoConstraints = false
        definesPresentationContextLabel.translatesAutoresizingMaskIntoConstraints = false
        buttons.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(classNameLabel)
        view.addSubview(presentingVCLabel)
        view.addSubview(modalPresentationStyleLabel)
        view.addSubview(definesPresentationContextLabel)
        view.addSubview(buttons)
        
        NSLayoutConstraint.activate([
            classNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            classNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            presentingVCLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentingVCLabel.topAnchor.constraint(equalTo: classNameLabel.bottomAnchor, constant: 20),
            modalPresentationStyleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            modalPresentationStyleLabel.topAnchor.constraint(equalTo: presentingVCLabel.bottomAnchor, constant: 20),
            definesPresentationContextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            definesPresentationContextLabel.topAnchor.constraint(equalTo: modalPresentationStyleLabel.bottomAnchor, constant: 20),
            buttons.topAnchor.constraint(equalTo: definesPresentationContextLabel.bottomAnchor, constant: 20),
            buttons.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        presentFullScreenButton.addTarget(self, action: #selector(presentFullScreen), for: .touchUpInside)
        presentCurrentContextButton.addTarget(self, action: #selector(presentCurrentContext), for: .touchUpInside)
        presentPageSheetButton.addTarget(self, action: #selector(presentPageSheet), for: .touchUpInside)
        presentPopoverButton.addTarget(self, action: #selector(presentPopOver), for: .touchUpInside)
        pushButton.addTarget(self, action: #selector(push), for: .touchUpInside)
        dismissButton.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        classNameLabel.text = "Class: " + Self.description().replacingOccurrences(of: "PresentHierarchy.", with: "")
        modalPresentationStyleLabel.text = "modalPresentationStyle: " + "\(self.modalPresentationStyle.description)"
        presentingVCLabel.text = "PresentingVC: \(self.presentingViewController?.description.replacingOccurrences(of: "PresentHierarchy.", with: "") ?? "None")"
        let context = self.presentingViewController?.definesPresentationContext == nil ? "nil" : "\(self.presentingViewController!.definesPresentationContext)"
        definesPresentationContextLabel.text = "PresentingVC's definesPresentationContext: \(context)"
    }
    
    @objc func push() {
        let vc = T()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func presentFullScreen() {
        let vc = T()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @objc func presentCurrentContext() {
        let vc = T()
        vc.modalPresentationStyle = .currentContext
        self.present(vc, animated: true)
    }
    
    @objc func presentPageSheet() {
        let vc = T()
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true)
    }
    
    @objc func presentPopOver() {
        let vc = T()
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true)
    }

    @objc func dismissSelf() {
        self.dismiss(animated: true)
    }
}

