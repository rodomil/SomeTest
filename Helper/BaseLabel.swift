//
//  BaseLabel.swift
//  Tesla-dev
//
//  Created by Rodomil on 30.12.2021.
//

import UIKit

class BaseLabel: UILabel {
    
    enum TypeFont: String {
        case regular
        case medium
        case bold
    }
    
    enum SiseFont: Double {
        case s_10 = 10
        case s_12 = 12
        case s_14 = 14
        case s_16 = 16
        case s_20 = 20
    }

    func initLabel(fontType: TypeFont, sizeFont: SiseFont) {
        minimumScaleFactor = 0.5
        adjustsFontSizeToFitWidth = true
        var font = ""
        
        switch fontType {
        case .regular: font = constants.nameRegularFont
        case .medium: font = constants.nameMediumFont
        case .bold: font = constants.nameBoldFont
        }

        self.font = UIFont(name: font, size: sizeFont.rawValue)
    }

}

