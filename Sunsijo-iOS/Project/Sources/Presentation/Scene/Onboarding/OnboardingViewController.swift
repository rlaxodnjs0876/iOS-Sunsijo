import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class OnboardingViewController: UIViewController {

    private var disposeBag = DisposeBag()

    // MARK: - UI
    private let logoImage = UIImageView().then {
        $0.image = UIImage(named: "KodomoLogo")
        $0.contentMode = .scaleAspectFit
    }
    private let startButton = UIButton(type: .system).then {
        $0.setTitle("시작하기", for: .normal)
        $0.backgroundColor = .primary
        $0.titleLabel?.font = .pretendard(ofSize: 17, family: .semiBold)
        $0.layer.cornerRadius = 5
        $0.setTitleColor(.white, for: .normal)
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        view.backgroundColor = .white
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }

    // MARK: - SetButton
    private func setButton() {
        startButton.rx.tap
            .subscribe { _ in
                let loginVC = LoginViewController()
                self.navigationController?.pushViewController(loginVC, animated: true)
            }.disposed(by: disposeBag)
    }
}

// MARK: - Layout
extension OnboardingViewController {
    func addSubviews() {
        [logoImage, startButton].forEach { view.addSubview($0) }
    }

    func makeSubviewConstraints() {
        logoImage.snp.makeConstraints() {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(173)
        }
        startButton.snp.makeConstraints() {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoImage.snp.bottom).offset(121)
            $0.height.equalTo(40)
            $0.width.equalTo(250)
        }
    }
}
