//
//  UIViewController.swift
//  BE
//
//  Created by GOngTAE on 2022/07/02.
//

import UIKit

extension UIViewController {
    //키보드 바깥 터치시 키보드 dismiss
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){self.view.endEditing(true)}
}
