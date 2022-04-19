import UIKit
import SnapKit

final class IntroSectionView:UIView{
    
    private lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .black
        return imageView
    }()
    private lazy var descriptionLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        
        
        label.text = "매달 찾아오는 새로운 오리지널.\n가족과 공유하세요.\n온/오프라인에서 감상하세요."
        label.textColor = .white
        label.font = .systemFont(ofSize: 15, weight: .bold)
        
        // 줄 간격 & 라벨 정렬
        let attrString = NSMutableAttributedString(string: label.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        paragraphStyle.alignment = .center
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        label.attributedText = attrString
        
        return label
    }()
    private lazy var freeTrialbutton:UIButton = {
        let button = UIButton()
        button.setTitle("무료 체험 시작", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    private lazy var freeTrialLabel:UILabel = {
        let label = UILabel()
        label.text = "7일 무료 체험 후 월 ₩6,500"
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    private lazy var logoLabel:UILabel = {
        let label = UILabel()
        label.text = "tv+"
        label.textColor = .white
        label.font = .systemFont(ofSize: 80, weight: .semibold)
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
private extension IntroSectionView{
    func setupViews(){
        [imageView, logoLabel, descriptionLabel, freeTrialbutton, freeTrialLabel].forEach{
            addSubview($0)
        }
        
        // 이미지 추가
        imageView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(snp.width).multipliedBy(1.3)
            $0.bottom.equalToSuperview()
        }
        
        // 체험라벨 추가
        freeTrialLabel.snp.makeConstraints{
            $0.bottom.equalTo(imageView.snp.bottom).inset(15)
            $0.centerX.equalTo(imageView.snp.centerX)
        }
        
        
        // 버튼 추가
        freeTrialbutton.snp.makeConstraints{
            $0.bottom.equalTo(freeTrialLabel.snp.top).offset(-5)
            $0.height.equalTo(40)
            $0.width.equalTo(260)
            $0.centerX.equalTo(imageView.snp.centerX)
        }
        // 설명라벨 추가
        descriptionLabel.snp.makeConstraints{
            $0.bottom.equalTo(freeTrialbutton.snp.top).offset(-15)
            $0.centerX.equalTo(imageView.snp.centerX)
        }
        // 로고라벨 추가
        logoLabel.snp.makeConstraints{
            $0.bottom.equalTo(descriptionLabel.snp.top).offset(-40)
            $0.centerX.equalTo(imageView.snp.centerX)
        }
    }
}
