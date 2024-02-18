//
//  GreenView.swift
//  fswf
//
//  Created by Ильнур Закиров on 18.02.2024.
//

import UIKit

class GreenView: View {
    
    weak var overlappingView: PurpleView?

    override init(id: String = "") {
        super.init(id: id)
        gest()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Тест кода Рамиза
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(point, with: event)
        
        if hitView == self {
            if let overlappingView = self.overlappingView {
                let pointInOverlappingView = self.convert(point, to: overlappingView)
                
                if overlappingView.bounds.contains(pointInOverlappingView) {
                    return nil
                }
            }
            
            return self
        }
        
        return hitView
    }
    
    func gest() {
        let gest = UITapGestureRecognizer(target: self, action: #selector(tap))
        addGestureRecognizer(gest)
    }
    
    @objc func tap() {
        UIView.animateKeyframes(withDuration: 1, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.transform = CGAffineTransform(rotationAngle: -30)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.transform = CGAffineTransform(rotationAngle: 0)
            }
        }
    }

}
