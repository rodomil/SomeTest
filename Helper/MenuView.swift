//
//  MenuView.swift
//  SomeTest
//
//  Created by Rodomil on 16.10.2023.
//

import UIKit

class MenuView: UIView {
        
    //MARK: - UI
    private lazy var menu = UIImageView().then() {
        $0.contentMode = .scaleAspectFit
        $0.image = R.image.menu()
    }
    private lazy var settings = UIImageView().then() {
        $0.contentMode = .scaleAspectFit
        $0.image = R.image.settings()
    }
    private lazy var edit = UIImageView().then() {
        $0.contentMode = .scaleAspectFit
        $0.image = R.image.edit()
    }
    private lazy var titleText = BaseLabel().then() {
        $0.initLabel(fontType: .medium, sizeFont: .s_20)
        $0.text = constants.MV_title
    }

    //MARK: - var
     
    //MARK: - Base function
    init() {
        super.init(frame: CGRect.zero)
        
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // MARK: - Private Methods
        
    private func commonInit() {
        setupStyle()
        addSubviews()
        makeConstraints()
    }
            
    private func setupStyle() {
        backgroundColor = .white
    }
            
    private func addSubviews() {
        add {
            menu
            titleText
            settings
            edit
        }
    }
            
    //MARK: - Snap
    private func makeConstraints() {
        menu.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(grid.space8)
            make.size.equalTo(appearance.MV_imageSize)
        }
        edit.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.size.equalTo(appearance.MV_imageSize)
            make.trailing.equalToSuperview().inset(grid.space8)
        }
        settings.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.size.equalTo(appearance.MV_imageSize)
            make.trailing.equalTo(edit.snp_leadingMargin).inset(-grid.space8)
        }
        titleText.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(menu.snp_trailingMargin).offset(grid.space24)
            make.trailing.equalTo(settings.snp_leadingMargin).inset(-grid.space8)
        }
    }
        
    //MARK: - Action
   
        
}
