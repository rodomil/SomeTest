//
//  BottomCollectionView.swift
//  SomeTest
//
//  Created by Rodomil on 16.10.2023.
//

import UIKit

class BottomCollectionView: UIView {
        
    //MARK: - UI
    private lazy var collection: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .clear
        collectionView.register(BottomCollectionViewCell.self, forCellWithReuseIdentifier: BottomCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var titleText = BaseLabel().then() {
        $0.text = constants.BCV_title
        $0.initLabel(fontType: .medium, sizeFont: .s_20)
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
        collection.delegate = self
        collection.dataSource = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        setupStyle()
        addSubviews()
        makeConstraints()
    }
            
    private func setupStyle() {
        backgroundColor = .clear
    }
            
    private func addSubviews() {
        add{
            titleText
            collection
        }
    }
            
    //MARK: - Snap
    private func makeConstraints() {
        titleText.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(grid.space16)
            make.height.equalTo(appearance.BCV_heihtTitle)
            make.top.equalToSuperview().inset(grid.space8)
        }
        collection.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(titleText.snp_bottomMargin).inset(-grid.space8)
            make.bottom.equalToSuperview().inset(grid.space8)
        }
    }
        
    //MARK: - Action
   
        
}
extension BottomCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bottomColData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BottomCollectionViewCell.identifier, for: indexPath) as! BottomCollectionViewCell
        cell.initcell(item: bottomColData[indexPath.row])
        return cell
    }
    
}

extension BottomCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: appearance.BCC_cellWidth, height: appearance.BCC_cellHeight)
    }
    

}
