//
//  ModalPresentationStyle+Extensions.swift
//  PresentHierarchy
//
//  Created by Junhyeong Hong on 2022/08/07.
//

import Foundation
import UIKit

extension UIModalPresentationStyle {
    var description: String {
        switch self {
        case .fullScreen:
            return "fullScreen"
        case .overFullScreen:
            return "overFullScreen"
        case .currentContext:
            return "currentContext"
        case .overCurrentContext:
            return "overCurrentContext"
        case .pageSheet:
            return "pageSheet"
        case .formSheet:
            return "formSheet"
        case .automatic:
            return "automatic"
        case .custom:
            return "custom"
        case .popover:
            return "popover"
        case .none:
            return "none"
        default:
            return "unknown"
        }
    }
}
