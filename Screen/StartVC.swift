//
//  StartVC.swift
//  SomeTest
//
//  Created by Rodomil on 13.10.2023.
//

import UIKit
import SnapKit
import Then

class StartVC: UIViewController {
        
    //MARK: - UI
    private lazy var menu = MenuView()
    private lazy var menuCollection: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .clear
        collectionView.register(MenuCellVC.self, forCellWithReuseIdentifier: MenuCellVC.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var mainCollection: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .clear
        collectionView.register(MainCollectionCell.self, forCellWithReuseIdentifier: MainCollectionCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.estimatedSize = false
        
        return collectionView
    }()
    
    private lazy var experiences = BaseLabel().then() {
        $0.initLabel(fontType: .medium, sizeFont: .s_20)
        $0.text = constants.MV_experiences
    }
    private lazy var chevron = UIImageView().then() {
        $0.contentMode = .scaleAspectFit
        $0.image = R.image.chevronRight()
    }
    private lazy var separator = UIImageView().then() {
        $0.contentMode = .scaleAspectFit
        $0.image = R.image.line()
    }
    private lazy var bottomCollection = BottomCollectionView()

    //MARK: - var
     
    //MARK: - Base function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuCollection.delegate = self
        menuCollection.dataSource = self
        menuCollection.translatesAutoresizingMaskIntoConstraints = false
        
        mainCollection.delegate = self
        mainCollection.dataSource = self
        mainCollection.translatesAutoresizingMaskIntoConstraints = false

        commonInit()
    }
        
    // MARK: - Private Methods
        
    private func commonInit() {
        setupStyle()
        addSubviews()
        makeConstraints()
    }
            
    private func setupStyle() {
        view.backgroundColor = UIColor.baground
    }
            
    private func addSubviews() {
        view.add {
            menu
            menuCollection
            experiences
            chevron
            mainCollection
            separator
            bottomCollection
        }
    }
            
    //MARK: - Snap
    private func makeConstraints() {
        menu.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(grid.space48)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(appearance.MV_height)
        }
        menuCollection.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(appearance.SV_topMenuHight)
            make.top.equalTo(menu.snp_bottomMargin).inset(-grid.space16)
        }
        chevron.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(grid.space8)
            make.size.equalTo(appearance.SV_imageChevronSize)
            make.top.equalTo(menuCollection.snp_bottomMargin).inset(-grid.space16)
        }
        experiences.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(grid.space16)
            make.centerY.equalTo(chevron)
        }
        
        separator.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(appearance.SV_lineHeight)
            make.bottom.equalToSuperview().inset(grid.SV_lineBottom)
        }
        mainCollection.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(grid.space16)
            make.top.equalTo(chevron.snp_bottomMargin).inset(-grid.space8)
            make.bottom.equalTo(separator.snp_topMargin).inset(-grid.space8)
        }
        bottomCollection.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(separator.snp_bottomMargin).inset(-grid.space8)
            make.bottom.equalToSuperview().inset(grid.space54)
        }
        
    }
        
    //MARK: - Action
        
}

extension StartVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case mainCollection: return mainColData.count
        default: return menuData.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case mainCollection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionCell.identifier, for: indexPath) as! MainCollectionCell
            cell.initCell(item:  mainColData[indexPath.row], id: indexPath.row)
            cell.delegate = self
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCellVC.identifier, for: indexPath) as! MenuCellVC
            cell.initcell(item: menuData[indexPath.row])
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case mainCollection: break
        default:
            for (index, _ ) in menuData.enumerated() {
                menuData[index].selected = false
            }
            menuData[indexPath.row].selected = true
            menuCollection.reloadData()
        }
        
    }
}

extension StartVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case mainCollection:
            let width = (view.frame.width - 40) / 2
            return CGSize(width: width - 5, height: width / appearance.SV_collectionCellHeight)
        default:
            var ss = grid.space12 * 2
            if menuData[indexPath.row].image != "" {
                ss = ss + appearance.SV_topMenuHight
            }
            let width = menuData[indexPath.row].name.width(withConstrainedHeight: 16, font: UIFont.systemFont(ofSize: 16) ) + ss
            return CGSize(width: width, height: appearance.SV_topMenuHight)
        }
        
    }
    

}

extension StartVC: MainCollectionCellProtocol {
    func pressFavorite(id: Int) {
        mainColData[id].favorite = !mainColData[id].favorite
        mainCollection.reloadData()
    }
}


extension StartVC: GridCompatible {}
extension StartVC: AppearanceCompatible {}
extension StartVC: ConstantsCompatible {}
