//
//  UIView+Extension.swift
//  Gen1Pokedex
//
//  Created by Consultant on 11/11/22.
//

import UIKit

//class UIViewBufferView: UIView {
//    
//}

extension UIView {
    
    static func createBufferView() -> UIView {
        
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        view.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return view
        
    }
    
}
