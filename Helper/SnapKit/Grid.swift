//
//  Grid.swift
//  Tesla-dev
//
//  Created by Rodomil on 24.12.2021.
//

import UIKit

/// Протокол для основных числовых констант для верстки и определяющий правила по которому верстаются визуальные компоненты
public protocol Grid {}

/// Содержит основные базовые числовые константы
extension Grid {
    /// Нулевой отступ
    public var zero: CGFloat { .zero }
    /// Отступ 0.5
    public var space05: CGFloat { 0.5 }
    /// Тонкая линия
    public var pixel: CGFloat { 1 / UIScreen.main.scale }
    /// Отступ 2
    public var space2: CGFloat { 2 }
    /// Отступ 4
    public var space4: CGFloat { 4 }
    /// Отступ 8
    public var space8: CGFloat { 8 }
    /// Отступ 10
    public var space10: CGFloat { 10 }
    /// Отступ 12
    public var space12: CGFloat { 12 }
    /// Отступ 16
    public var space16: CGFloat { 16 }
    /// Отступ 18
    public var space18: CGFloat { 18 }
    /// Отступ 20
    public var space20: CGFloat { 20 }
    /// Отступ 24
    public var space24: CGFloat { 24 }
    /// Отступ 32
    public var space32: CGFloat { 32 }
    /// Отступ 36
    public var space36: CGFloat { 36 }
    /// Отступ 48
    public var space48: CGFloat { 48 }
    /// Отступ 54
    public var space54: CGFloat { 54 }
    /// Отступ 60
    public var space60: CGFloat { 60 }
    /// Отступ 64
    public var space64: CGFloat { 64 }
    /// Отступ 72
    public var space72: CGFloat { 72 }
    
    //MARK: StartVC
    public var SV_lineBottom: Double { 260 }
    
    //MARK: BootomCollectionCell
    public var BCC_imageBottom: Double {34 }
}

/// Обертка для Grid совместимых типов
public struct GridWrapper<Base>: Grid {
    private let base: Base
    init(_ base: Base) {
        self.base = base
    }
}

/// Протокол описывающий которому должны конформить совместимы с Grid типами
public protocol GridCompatible: AnyObject {}

extension GridCompatible {
    /// Предоставляет namespace обертку для Grid совместимых типов.
    public var grid: GridWrapper<Self> { GridWrapper(self) }
}
