//
//  MenuCellVC.swift
//  SomeTest
//
//  Created by Rodomil on 13.10.2023.
//

import UIKit

class MenuCellVC: UICollectionViewCell {
    
    static let identifier = "cell"
        
    //MARK: - UI
    private lazy var fonView = UIView().then() {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = appearance.SV_topMenuHight / 2
        $0.clipsToBounds = true
        $0.layer.borderWidth = 1
    }
    private lazy var titleText = BaseLabel().then() {
        $0.initLabel(fontType: .regular, sizeFont: .s_16)
    }
    
    private lazy var image = UIImageView().then() {
        $0.contentMode = .scaleAspectFit
    }

    //MARK: - var
     
    //MARK: - Base function

    func initcell(item: TopMenuStruct) {
        
        if item.selected {
            titleText.textColor = .gray
            fonView.layer.borderColor = UIColor.gray.cgColor
        } else {
            titleText.textColor = UIColor.userBlue
            fonView.layer.borderColor = UIColor.userBlue.cgColor
        }
        
        if item.image != "" {
            image.image = UIImage(named: item.image)
        } else { image.image = nil }
        titleText.text = item.name
        
        commonInit()
    }
        
    // MARK: - Private Methods
        
    private func commonInit() {
        setupStyle()
        addSubviews()
        makeConstraints()
    }
            
    private func setupStyle() {

    }
            
    private func addSubviews() {
        add {
            fonView
            titleText
        }
        if image.image != nil {
            add {
                image
            }
        }
    }
            
    //MARK: - Snap
    private func makeConstraints() {
        fonView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        if image.image != nil {
            titleText.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.leading.equalToSuperview().inset(grid.space12)
            }
            image.snp.makeConstraints { make in
                make.leading.equalTo(titleText.snp_trailingMargin)
                make.trailing.equalToSuperview().inset(grid.space12)
                make.centerY.equalToSuperview()
                make.size.equalTo(appearance.SV_topMenuImageCell)
            }
        } else {
            titleText.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.leading.trailing.equalToSuperview().inset(grid.space12)
            }
        }
    }
        
    //MARK: - Action
   
        
}
