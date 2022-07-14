//
//  UILabel Extention.swift
//  Pass to Valhalla
//
//  Created by Александр Прайд on 14.07.2022.
//

import UIKit
import SnapKit

extension UILabel {
    
    func edgeTo(view: UIView) {
        self.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
}
