//
//  TextField.swift
//  Pass to Valhalla
//
//  Created by Александр Прайд on 12.07.2022.
//

import UIKit

class TextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .themeWhite()
        textColor = .themeBlack()
        
        leftView = UIView(frame: CGRect(x: 0, y: 0,
                                                         width: 20,
                                                         height: self.frame.height))
        
        // leftViewMode отображается всегда
        
        // кнопка "очистить textField"
        clearButtonMode = .always
        // тип кнопки на клавиатере
        returnKeyType = .join
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0,
                                               width: self.frame.width,
                                               height: 2))
        leftView = paddingView
        leftViewMode = .always
        
        placeholder = "write here"
        font = UIFont.runicAltNoFont()
        tintColor = .darkGray
        
        setupBottomLine()
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setupBottomLine() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
    }
    
}
