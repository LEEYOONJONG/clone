//
//  SeasonSectionCollectionView.swift
//  AppleTV
//
//  Created by YOONJONG on 2022/04/19.
//

import Foundation
import UIKit

final class SeasonSectionCollectionViewCell:UICollectionViewCell{
    private lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    func setup(){
        setupLayout()
        imageView.backgroundColor = .gray
    }
}


private extension SeasonSectionCollectionViewCell{
    private func setupLayout(){
        addSubview(imageView)
        imageView.snp.makeConstraints{
            $0.leading.top.trailing.equalToSuperview()
            $0.height.equalTo(snp.width).multipliedBy(0.6)
        }
    }
}
