//
//  UIScrollView Extention.swift
//  Pass to Valhalla
//
//  Created by Александр Прайд on 14.07.2022.
//

import UIKit
import SnapKit

extension UIScrollView {
    
    func edgeTo(view: UIView) {
        
        self.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
}

extension UIScrollView {
    
    func scrollTo(horizontalPage: Int? = 0, verticalPage: Int? = 0, animated: Bool? = true) {
        var frame: CGRect = self.frame
        frame.origin.x = frame.size.width *
        CGFloat(horizontalPage ?? 0) *
        frame.origin.y * CGFloat(verticalPage ?? 0)
        self.scrollRectToVisible(frame, animated: true)
        
    }
}
