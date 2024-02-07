//
//  MainCollectionCell.swift
//  SomeTest
//
//  Created by Rodomil on 16.10.2023.
//

import UIKit

protocol MainCollectionCellProtocol: AnyObject {
    func pressFavorite(id: Int)
}

class MainCollectionCell: UICollectionViewCell {
    
    static let identifier = "cell"
        
    //MARK: - UI
    private lazy var image = UIImageView().then() {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.layer.cornerRadius = appearance.BCC_radius
    }
    private lazy var favoriteImage = UIButton().then() {
//        $0.contentMode = .scaleAspectFit
//        $0.image = R.image.heart()
        $0.setTitle("", for: .normal)
        $0.setImage(R.image.heart(), for: .normal)
        $0.addTarget(self, action: #selector(pressFavorite), for: .touchUpInside)
    }
    private lazy var country = BaseLabel().then() {
        $0.initLabel(fontType: .bold, sizeFont: .s_10)
        $0.alpha = 0.64
    }
    private lazy var name = BaseLabel().then() {
        $0.initLabel(fontType: .medium, sizeFont: .s_14)
        $0.numberOfLines = 0
    }
    private lazy var price = BaseLabel().then() {
        $0.initLabel(fontType: .regular, sizeFont: .s_12)
        $0.alpha = 0.56
    }
    private lazy var star1 = UIImageView().then() {
        $0.contentMode = .scaleAspectFit
    }
    private lazy var star2 = UIImageView().then() {
        $0.contentMode = .scaleAspectFit
    }
    private lazy var star3 = UIImageView().then() {
        $0.contentMode = .scaleAspectFit
    }
    private lazy var star4 = UIImageView().then() {
        $0.contentMode = .scaleAspectFit
    }
    private lazy var star5 = UIImageView().then() {
        $0.contentMode = .scaleAspectFit
    }
    private lazy var feedback = BaseLabel().then() {
        $0.initLabel(fontType: .bold, sizeFont: .s_10)
    }
    private lazy var stack = UIStackView().then() {
        $0.axis = .horizontal
    }
    
    //MARK: - Var
    weak var delegate: MainCollectionCellProtocol?
    private lazy var id = -1

    //MARK: - Base function
    func initCell(item: MainCollectionStruct, id: Int) {
        self.id = id
        image.image = UIImage(named: item.image)
        country.text = item.contry
        name.text = item.name
        price.text = item.price
        item.favorite ? (favoriteImage.setImage(R.image.heartOn(), for: .normal)) : (favoriteImage.setImage(R.image.heart(), for: .normal))
        feedback.text = "\(item.feedback)"
        stars(item.stars)
        commonInit()
    }
    
        
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
            image
            favoriteImage
            country
            name
            price
            stack.add {
                star1
                star2
                star3
                star4
                star5
                feedback
            }
        }
    }
            
    //MARK: - Snap
    private func makeConstraints() {
        image.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(frame.width / appearance.MCC_imageCellWidth)
        }
        favoriteImage.snp.makeConstraints { make in
            make.size.equalTo(appearance.MCC_favoriteSize)
            make.top.trailing.equalToSuperview().inset(grid.space4)
        }
        country.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(image.snp.bottom).inset(-grid.space8)
            make.height.equalTo(appearance.MCC_countryHeight)
        }
        name.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(country.snp.bottom).inset(-grid.space8)
        }
        price.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(name.snp.bottom).inset(-grid.space8)
        }
        star1.snp.makeConstraints { make in
            make.size.equalTo(appearance.MCC_starSize)
        }
        star2.snp.makeConstraints { make in
            make.size.equalTo(appearance.MCC_starSize)
        }
        star3.snp.makeConstraints { make in
            make.size.equalTo(appearance.MCC_starSize)
        }
        star4.snp.makeConstraints { make in
            make.size.equalTo(appearance.MCC_starSize)
        }
        star5.snp.makeConstraints { make in
            make.size.equalTo(appearance.MCC_starSize)
        }
        stack.snp.makeConstraints { make in
            make.height.equalTo(appearance.MCC_starSize)
            make.top.equalTo(price.snp.bottom).inset(-grid.space8)
        }
        
        

    }
        
    //MARK: - Ptivate metod
    
    private func stars(_ count: Int) {
        switch count {
        case 1:
            star1.image = R.image.star_On()
            star2.image = R.image.star_Off()
            star3.image = R.image.star_Off()
            star4.image = R.image.star_Off()
            star5.image = R.image.star_Off()
        case 2:
            star1.image = R.image.star_On()
            star2.image = R.image.star_On()
            star3.image = R.image.star_Off()
            star4.image = R.image.star_Off()
            star5.image = R.image.star_Off()
        case 3:
            star1.image = R.image.star_On()
            star2.image = R.image.star_On()
            star3.image = R.image.star_On()
            star4.image = R.image.star_Off()
            star5.image = R.image.star_Off()
        case 4:
            star1.image = R.image.star_On()
            star2.image = R.image.star_On()
            star3.image = R.image.star_On()
            star4.image = R.image.star_On()
            star5.image = R.image.star_Off()
        default:
            star1.image = R.image.star_On()
            star2.image = R.image.star_On()
            star3.image = R.image.star_On()
            star4.image = R.image.star_On()
            star5.image = R.image.star_On()
        }
    }
   
    //MARK: - Action
    
    @objc private func pressFavorite() {
        delegate?.pressFavorite(id: id)
    }
}
