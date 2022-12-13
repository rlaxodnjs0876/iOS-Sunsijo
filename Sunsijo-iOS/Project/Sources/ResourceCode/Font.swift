import UIKit

extension UIFont {
    enum Family: String {
        case regular = "Regular"
        case medium = "Medium"
        case bold = "Bold"
        case semiBold = "SemiBold"
        case black = "Black"
    }

    static func pretendard(ofSize: CGFloat, family: Family) -> UIFont {
        return UIFont(name: "Pretendard-\(family.rawValue)", size: ofSize)!
    }
}
