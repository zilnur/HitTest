//
//  RedView.swift
//  fswf
//
//  Created by Ильнур Закиров on 18.02.2024.
//

import UIKit

class RedView: View {

    override init(id: String = "") {
        super.init(id: id)
        gest()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func gest() {
        let gest = UITapGestureRecognizer(target: self, action: #selector(tap))
        addGestureRecognizer(gest)
    }
    
    @objc func tap() {
        UIView.animateKeyframes(withDuration: 1, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        }
    }

}
