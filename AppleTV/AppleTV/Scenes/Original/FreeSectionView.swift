import SnapKit
import UIKit

final class FreeSectionView:UIView{
    private lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Apple TV+ 무료로 맛보기!"
        return label
    }()
    private lazy var subTitleLabel:UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .systemGray2
        label.text = "지금 감상하세요."
        return label
    }()
    private lazy var showAllButton:UIButton = {
        let button = UIButton()
        button.setTitle("전체 보기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        return button
    }()
    
    private lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(FreeSectionCollectionViewCell.self, forCellWithReuseIdentifier: "FreeSectionCollectionViewCell")
        return collectionView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FreeSectionView:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FreeSectionCollectionViewCell", for: indexPath) as? FreeSectionCollectionViewCell
        cell?.setup()
        return cell ?? UICollectionViewCell()
    }
    
    
}
extension FreeSectionView:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 240, height: 240)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}

private extension FreeSectionView{
    func setupViews(){
        
        
        collectionView.backgroundColor = .clear
        [titleLabel, showAllButton, subTitleLabel, collectionView].forEach{
            addSubview($0)
        }
        titleLabel.snp.makeConstraints{
            $0.leading.top.equalToSuperview().inset(16)
        }
        showAllButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalTo(titleLabel.snp.centerY)
        }
        subTitleLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        collectionView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(subTitleLabel.snp.bottom)
            $0.height.equalTo(260)
            $0.bottom.equalToSuperview()
        }
    }
}
extension FreeSectionView{
    
}
