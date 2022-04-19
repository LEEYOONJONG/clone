import UIKit
import SnapKit

final class LatestOriginalSectionCollectionViewCell:UICollectionViewCell{
    private lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 11, weight: .semibold)
        return label
    }()
    private lazy var episodeLabel:UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    private lazy var descriptionLabel:UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 3
        return label
    }()
    func setup(){
        setupLayout()
        titleLabel.text = "드라마"
        episodeLabel.text = "'로어: 세상을 향한 함성' - Roar"
        descriptionLabel.text = "생생한 이야기를 여러 장르에 걸쳐 선보이는 블랙 코미디 시리즈."
        imageView.backgroundColor = .systemGray
    }
}

private extension LatestOriginalSectionCollectionViewCell{
    
    func setupLayout(){
        [imageView, titleLabel, episodeLabel, descriptionLabel].forEach{
            addSubview($0)
        }
        imageView.snp.makeConstraints{
            $0.leading.top.trailing.equalToSuperview()
            $0.height.equalTo(snp.width).multipliedBy(0.6)
        }
        titleLabel.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(imageView.snp.bottom).offset(5)
        }
        episodeLabel.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(3)
        }
        descriptionLabel.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(episodeLabel.snp.bottom).offset(5)
        }
    }
}
