//
//  StatusLabel.swift
//  Pass to Valhalla
//
//  Created by Александр Прайд on 12.07.2022.
//

import UIKit

class StatusLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
    
        textColor = .themeBlack()
        font = UIFont.runicAltNoFont()
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
        
    }
}
