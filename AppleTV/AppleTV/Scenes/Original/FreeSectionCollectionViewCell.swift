import UIKit
import SnapKit

final class FreeSectionCollectionViewCell:UICollectionViewCell{
    private lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
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
        label.textColor = .systemGray3
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 3
        return label
    }()
    func setup(){
        setupLayout()
        titleLabel.text = "'파친코' - PACHINKO 시즌 1, 에피소드 1"
        episodeLabel.text = "제1장"
        descriptionLabel.text = "1920년대의 한국, 1. 이대로로 실행해도 아무런 값이 없기에 임의의 값을 설정해줘야. 커스텀셀을 컬렉션뷰에서 설정해주겠다.register를 방금만든 클래스로 바꾸고 cell을 초기화하는 곳에서도 as? 이용해 다운캐스팅."
        imageView.backgroundColor = .systemGray
    }
}

private extension FreeSectionCollectionViewCell{
    
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
