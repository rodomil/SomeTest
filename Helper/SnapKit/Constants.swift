//
//   Constants.swift
//  Tesla-dev
//
//  Created by Rodomil on 27.12.2021.
//

import Foundation
import UIKit

/// Протокол где находятся числовые и текстовые константы
public protocol Constants {}

/// Содержит основные базовые числовые константы
extension Constants {

    public var nameBoldFont: String {"System Semibold"}
    public var nameMediumFont: String { "System Medium" }
    public var nameRegularFont: String { "System" }
    
    //MARK: MenuView
    public var MV_title: String { "Cards" }
    public var MV_experiences: String { "Experiences" }
    
    //MARK: BootomCollectionView
    public var BCV_title: String { "Scrolls horizontally" }
}

/// Обертка для Appearance совместимых типов
public struct ConstantsWrapper<Base>: Constants {
    private let base: Base
    init(_ base: Base) {
        self.base = base
    }
}

/// Протокол описывающий которому должны конформить совместимы с Appearance типами
public protocol ConstantsCompatible: AnyObject {}

extension ConstantsCompatible {
    /// Предоставляет namespace обертку для Appearance совместимых типов.
    public var constants: ConstantsWrapper<Self> { ConstantsWrapper(self) }
}
