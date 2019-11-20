//
//  Nib.swift
//  RusMusic
//
//  Created by Rustam Gradov on 04.11.2019.
//  Copyright © 2019 Rustam Gradov. All rights reserved.
//

import UIKit

extension UIView {
    
    
    class func loadFromNib<T: UIView>() -> T {
        
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
}

