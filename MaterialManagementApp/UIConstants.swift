//
//  UIConstants.swift
//  MaterialManagementApp
//
//  Created by Min Ku An on 2022-10-12.
//

import SwiftUI

enum UIConstants { // 이렇게 하면 initialize 안하고 즉, UIConstants().buttonColor라고 안하고, UIConstnats.buttonColor 로 사용할 수 있음
    static let buttonColor = Color("buttonColor")
    static let resetButtonColor = Color("resetButtonColor")
    static let saveButtonColor = Color("saveButtonColor")
    static let backgroundColor = Color("backgroundColor")
    static let totalColor = Color("totalColor")
    
    static let totalIconRadius: CGFloat = 50
}
