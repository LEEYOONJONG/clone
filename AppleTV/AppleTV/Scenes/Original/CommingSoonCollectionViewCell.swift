import UIKit
import SnapKit

final class CommingSoonSectionCollectionViewCell:UICollectionViewCell{
    private lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 11, weight: .semibold)
        return label
    }()
    
    func setup(){
        setupLayout()
        titleLabel.text = "금요일에 첫 공개되는 새로운 다큐멘터리 시리즈."
        imageView.backgroundColor = .systemGray
    }
}

private extension CommingSoonSectionCollectionViewCell{
    
    func setupLayout(){
        [imageView, titleLabel].forEach{
            addSubview($0)
        }
        imageView.snp.makeConstraints{
            $0.leading.top.trailing.equalToSuperview()
            $0.height.equalTo(snp.width).multipliedBy(0.6)
        }
        titleLabel.snp.makeConstraints{
            $0.centerX.equalTo(imageView.snp.centerX)
            $0.bottom.equalTo(imageView.snp.bottom).inset(5)
        }
        
    }
}
