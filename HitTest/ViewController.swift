//
//  ViewController.swift
//  HitTest
//
//  Created by Ильнур Закиров on 18.02.2024.
//

import UIKit

class ViewController: UIViewController {

    let purpleView: PurpleView = {
        let view = PurpleView()
        view.backgroundColor = .purple
        view.id = "A"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let redView: RedView = {
        let view = RedView()
        view.backgroundColor = .red
        view.id = "B"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var greenView: GreenView = {
        let view = GreenView()
        view.backgroundColor = .green
        view.overlappingView = purpleView
        view.id = "C"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let yellowView: YellowView = {
        let view = YellowView()
        view.backgroundColor = .yellow
        view.id = "D"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }
    
    func setupViews() {
        view.addSubview(purpleView)
        purpleView.addSubview(redView)
        redView.addSubview(greenView)
        greenView.addSubview(yellowView)
        [
            purpleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            purpleView.topAnchor.constraint(equalTo: view.topAnchor),
            purpleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            purpleView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            redView.centerXAnchor.constraint(equalTo: purpleView.centerXAnchor),
            redView.centerYAnchor.constraint(equalTo: purpleView.centerYAnchor),
            redView.heightAnchor.constraint(equalTo: purpleView.heightAnchor, multiplier: 0.5),
            redView.widthAnchor.constraint(equalTo: purpleView.widthAnchor, multiplier: 0.8),
            
            greenView.bottomAnchor.constraint(equalTo: redView.bottomAnchor, constant: 50),
            greenView.heightAnchor.constraint(equalTo: redView.widthAnchor, multiplier: 0.5),
            greenView.widthAnchor.constraint(equalTo: redView.widthAnchor, multiplier: 0.5),
            greenView.centerXAnchor.constraint(equalTo: redView.centerXAnchor),
            
            yellowView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            yellowView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            yellowView.heightAnchor.constraint(equalToConstant: 50),
            yellowView.widthAnchor.constraint(equalToConstant: 50)
        ].forEach{$0.isActive = true}
    }

}

