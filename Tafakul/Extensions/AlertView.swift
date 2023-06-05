//
//  AlertView.swift
//  Tafakul
//
//  Created by Tariqul on 15/10/22.
//

import Foundation
class AlertController: UIAlertController {

    /// Buttons background color.
    var buttonBackgroundColor: UIColor = .darkGray {
        didSet {
            // Invalidate current colors on change.
            view.setNeedsLayout()
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // Traverse view hierarchy.
        view.allViews.forEach {
            // If there was any non-clear background color, update to custom background.
            if let color = $0.backgroundColor, color != .clear {
                $0.backgroundColor = buttonBackgroundColor
            }
            // If view is UIVisualEffectView, remove it's effect and customise color.
            if let visualEffectView = $0 as? UIVisualEffectView {
                visualEffectView.effect = nil
                visualEffectView.backgroundColor = buttonBackgroundColor
            }
        }

        // Update background color of popoverPresentationController (for iPads).
        popoverPresentationController?.backgroundColor = buttonBackgroundColor
    }

}


extension UIView {

    /// All child subviews in view hierarchy plus self.
    fileprivate var allViews: [UIView] {
        var views = [self]
        subviews.forEach {
            views.append(contentsOf: $0.allViews)
        }

        return views
    }

}
