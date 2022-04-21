//
//  ViewController.swift
//  YogaExperiment
//
//  Created by Laura Garcia on 21/4/22.
//

import UIKit
import YogaKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    let container = UIView()
    let redView = UIView()
    let redlabel = UILabel()
    let blueView = UIView()
    let blueLabel = UILabel()
    let button = UIButton(type: .system)
    
    //MARK: -ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let rootView = view else {
            return
        }
        setUpUI(rootView: rootView)
    }
    
    //MARK: - UISetUp
    
    private func setUpUI(rootView: UIView) {
        rootView.configureLayout { layout in
            layout.isEnabled = true
            layout.flexDirection = .column
            layout.paddingTop = 15
            layout.justifyContent = .spaceAround
        }
        
        //MARK: - Title
        
        let title = UILabel()
        title.text = "YogaKit"
        title.textColor = .white
        title.backgroundColor = .black
        title.textAlignment = .center
        title.configureLayout { layout in
            layout.isEnabled = true
            layout.width = YGValue(self.view.frame.size.width)
            layout.height = 50
            layout.alignSelf = .center
        }
        rootView.addSubview(title)
        
        //MARK: - ContainerView
        
        container.layer.borderWidth = 1
        container.layer.borderColor = UIColor.label.cgColor
        container.configureLayout { layout in
            layout.isEnabled = true
            layout.flexDirection = .column
            layout.justifyContent = .center
            layout.height = 500
            layout.width = YGValue(self.view.frame.size.width)
        }
        rootView.addSubview(container)

        //MARK: - RedView
        
        redView.backgroundColor = .systemRed
        
        redView.configureLayout { layout in
            layout.isEnabled = true
            layout.flexGrow = 1
            layout.flexShrink = 1
        }
        container.addSubview(redView)
        
        //MARK: - RedLabel
        
        redlabel.text = "Nice"
        redlabel.textColor = .systemBlue
        redlabel.configureLayout { layout in
            layout.isEnabled = true
            layout.alignSelf = .center
        }
        redView.addSubview(redlabel)
        
        //MARK: - BlueView
        
        blueView.backgroundColor = .systemBlue
        blueView.configureLayout { layout in
            layout.isEnabled = true
            layout.flexGrow = 1
            layout.flexShrink = 1
        }
        
        container.addSubview(blueView)
        
        //MARK: - BlueLabel
    
        blueLabel.text = "Nice"
        blueLabel.textColor = .systemRed
        
        blueLabel.configureLayout { layout in
            layout.isEnabled = true
            layout.alignSelf = .center
        }
        
        blueView.addSubview(blueLabel)
        
        //MARK: - WIP- Button
        
        button.setTitle("Show Blue view", for: .selected)
        button.setTitle("Hide Blue View", for: .normal)
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.configureLayout { layout in
            layout.isEnabled = true
            layout.width = 200
            layout.height = 50
            layout.alignSelf = .center
        }
        rootView.addSubview(button)
        
        rootView.yoga.applyLayout(preservingOrigin: false)
    }
}

extension ViewController {
    @objc private func didTapButton() {
        button.isSelected = !button.isSelected
        blueView.isHidden = !blueView.isHidden
        blueView.yoga.isIncludedInLayout = !blueView.yoga.isIncludedInLayout
        view!.yoga.applyLayout(preservingOrigin: false)
    }
}
