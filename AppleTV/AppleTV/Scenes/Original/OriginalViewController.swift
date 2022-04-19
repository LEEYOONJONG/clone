import UIKit
import SnapKit

final class OriginalViewController:UIViewController{
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private lazy var stackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        
        // MARK: temporary
        let introSectionView = IntroSectionView(frame: .zero)
        let freeSectionView = FreeSectionView(frame: .zero)
        let popularSectionView = PopularSectionView(frame: .zero)
        let seasonSectionView = SeasonSectionView(frame: .zero)
        let latestOriginalSectionView = LatestOriginalSectionView(frame: .zero)
        let commingSoonSectionView = CommingSoonSectionView(frame: .zero)

        
        [introSectionView, freeSectionView, popularSectionView, seasonSectionView, latestOriginalSectionView, commingSoonSectionView].forEach{
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupLayout()
    }
    
}
private extension OriginalViewController{
    func setupNavigationController(){
        navigationItem.title = "tv+"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    func setupLayout(){
        navigationController?.navigationBar.isHidden = true
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }

}
