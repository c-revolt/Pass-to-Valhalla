//
//  UIView Extantion.swift
//  Pass to Valhalla
//
//  Created by Александр Прайд on 14.07.2022.
//


import UIKit
import SnapKit

extension UIView {
    
    func pinTo(_ view: UIView) {
        
        self.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(12)
        }
    }
}
