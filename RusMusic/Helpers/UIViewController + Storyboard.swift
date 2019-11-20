//
//  UIViewController + Storyboard.swift
//  RusMusic
//
//  Created by Rustam Gradov on 25.10.2019.
//  Copyright © 2019 Rustam Gradov. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    class func loadFromStoryboard<T: UIViewController>() -> T {
        
        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        if let viewController = storyboard.instantiateInitialViewController() as? T {
            return viewController
        }
        else {
            fatalError("Error: No initial view controller in \(name) storyboard")
        }
    }
}
