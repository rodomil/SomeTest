//
//  BottomCollectionViewCell.swift
//  SomeTest
//
//  Created by Rodomil on 16.10.2023.
//

import UIKit

class BottomCollectionViewCell: UICollectionViewCell {
    static let identifier = "cell"
    
    //MARK: - UI
    private lazy var fonView = UIView().then() {
        $0.layer.cornerRadius = appearance.BCC_radius
        $0.clipsToBounds = true
        $0.backgroundColor = .white
    }
    private lazy var image = UIImageView().then() {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = appearance.BCC_radius
    }
    private lazy var titleText = BaseLabel().then() {
        $0.initLabel(fontType: .medium, sizeFont: .s_14)
    }
    
    //MARK: - Base function

    func initcell(item: TopMenuStruct) {
        
        titleText.text = item.name
        image.image = UIImage(named: item.image)
        
        commonInit()
    }
        
    // MARK: - Private Methods
        
    private func commonInit() {
        setupStyle()
        addSubviews()
        makeConstraints()
    }
            
    private func setupStyle() {
        backgroundColor = .clear
    }
            
    private func addSubviews() {
        add {
            fonView.add {
                image
                titleText
            }
        }
    }
            
    //MARK: - Snap
    private func makeConstraints() {
        fonView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        image.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(grid.BCC_imageBottom)
//            make.height.equalTo(appearance.BCC_imageHeight)
        }
        titleText.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(grid.space8)
            make.bottom.equalToSuperview()
            make.top.equalTo(image.snp_bottomMargin)
        }
    }
        
    //MARK: - Action
   
        
}
