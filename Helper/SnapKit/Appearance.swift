//
//  Appearance.swift
//  Tesla-dev
//
//  Created by Rodomil on 24.12.2021.
//


import UIKit

/// Протокол для основных числовых констант для верстки содержащий цвета, альфы и прочее
public protocol Appearance {}

/// Содержит основные базовые числовые константы
extension Appearance {
    
    public var labelHeigth21: Double { 21 }
    
    public var viewMinHeigth: Double { 750 }
    
    public var topLineHight: Double { 4 }
    public var topLineWidth: Double { 32 }
    
    public var colorFonView: UIColor { .secondaryLabel }
    
    public var baseLabelHeight: Double { 24 }
    
    public var baseColorLabel2: UIColor { UIColor(hexString: "#8F97B1") } //основной светлый
    public var colorBorder: UIColor { UIColor(hexString: "#EBEEF6") } //gray

    //MARK: MenuView
    public var MV_imageSize: Double { 40 }
    public var MV_height: Double { 56 }
    
    //MARK: StartVC
    public var SV_topMenuHight: CGFloat { 32 }
    public var SV_topMenuImageCell: Double { 24 }
    public var SV_imageChevronSize: Double { 40 }
    public var SV_lineHeight: Double { 1 }
    public var SV_collectionCellHeight: Double { 0.64 }
    
    //MARK: MainCollectionCell
    public var MCC_countryHeight: Double { 32 }
    public var MCC_starSize: Double { 12 }
    public var MCC_imageCellWidth: Double { 1.31 }
    public var MCC_favoriteSize: Double { 24 }
    
    //MARK: BootomCollectionCell
    public var BCC_radius: Double { 6 }
    public var BCC_cellHeight: Double { 140 }
    public var BCC_cellWidth: Double { 136 }
    public var BCC_imageHeight: Double { 140 }
    
    //MARK: BootomCollectionView
    public var BCV_heihtTitle: Double { 40 }
}

/// Обертка для Appearance совместимых типов
public struct AppearanceWrapper<Base>: Appearance {
    private let base: Base
    init(_ base: Base) {
        self.base = base
    }
}

/// Протокол описывающий которому должны конформить совместимы с Appearance типами
public protocol AppearanceCompatible: AnyObject {}

extension AppearanceCompatible {
    /// Предоставляет namespace обертку для Appearance совместимых типов.
    public var appearance: AppearanceWrapper<Self> { AppearanceWrapper(self) }
}
