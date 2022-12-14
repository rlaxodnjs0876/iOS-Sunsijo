import UIKit

extension UIViewController {
    func setNavigation(_ title: String) {
        view.backgroundColor = .white
        self.title = title
        if  let navigationBar = navigationController?.navigationBar {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .white
            appearance.titleTextAttributes = [
                NSAttributedString.Key.font: UIFont.pretendard(ofSize: 20, family: .bold)
            ]
            appearance.shadowColor = .clear
            navigationBar.scrollEdgeAppearance = appearance
        }
    }
}
