//
//  ViewController.swift
//  YogaExperiment
//
//  Created by Laura Garcia on 21/4/22.
//

import UIKit
import YogaKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let rootView = view else {
            return
        }
        setUpUI(rootView: rootView)
    }
    private func setUpUI(rootView: UIView) {
        rootView.configureLayout { layout in
            layout.isEnabled = true
            layout.flexDirection = .column
            layout.paddingTop = 80
        }
        let title = UILabel()
        title.text = "Test"
        title.textColor = .white
        title.backgroundColor = .black
        title.textAlignment = .center
        title.configureLayout { layout in
            layout.isEnabled = true
            layout.width = 300
            layout.height = 50
            layout.alignSelf = .center
        }
        rootView.addSubview(title)
        
        let container = UIView()
        container.layer.borderWidth = 1
        container.layer.borderColor = UIColor.label.cgColor
        container.configureLayout { layout in
            layout.isEnabled = true
            layout.flexDirection = .row
            layout.justifyContent = .center
            layout.height = 300
            layout.width = YGValue(self.view.frame.size.width)
        }
        rootView.addSubview(container)
        //Continue at 9:49
        let redView = UIView()
        
        redView.backgroundColor = .systemRed
        rootView.addSubview(redView)
        redView.configureLayout { layout in
            
        }
        
        rootView.yoga.applyLayout(preservingOrigin: false)
    }
}
