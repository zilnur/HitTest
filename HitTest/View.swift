//
//  View.swift
//  fswf
//
//  Created by Ильнур Закиров on 18.02.2024.
//

import UIKit

class View: UIView {
    
    var id = ""
    
    init(id: String = "") {
        self.id = id
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//      findSubview(parent: self, point: point, event: event)
        print(self.id)
        return super.hitTest(point, with: event)
    }
    
    //Метод для запуска в hitTest для нахождения View, назодящейся в цепочке иерархий сабВью.
    func findSubview(parent: UIView, point: CGPoint, event: UIEvent?) -> UIView? {
        
        for sub in parent.subviews {
            let newPoint = parent.convert(point, to: sub)
            if let view = findSubview(parent: sub, point: newPoint, event: event) {
                return view
            }
        }
        
        if parent.point(inside: point, with: event) {
            return parent
        } else {
            return nil
        }
        
    }
}
