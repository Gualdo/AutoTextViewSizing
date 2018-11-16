//
//  ViewController.swift
//  AutoTextViewSizing
//
//  Created by De La Cruz, Eduardo on 16/11/2018.
//  Copyright © 2018 De La Cruz, Eduardo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Here we create our text view
        
        let textView = UITextView()
        textView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        textView.backgroundColor = .lightGray
        textView.text = "Here is some default text that we want to show and it might be a couple of lines that are word wrapped"
        
        view.addSubview(textView)
        
        // Use auto layout to set my textView frame...
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        [
//            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            textView.heightAnchor.constraint(equalToConstant: 50)
            ].forEach { $0.isActive = true }
        
        textView.font = UIFont.preferredFont(forTextStyle: .headline)
        
        textView.delegate = self
        textView.isScrollEnabled = false
        textViewDidChange(textView)
    }
}

extension ViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: view.safeAreaLayoutGuide.layoutFrame.size.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        textView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
            }
        }
    }
}
