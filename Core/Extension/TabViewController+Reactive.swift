//
//  TabViewController+Reactive.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 24/10/21.
//

import RxSwift
import RxCocoa

public extension Reactive where Base: UITabBarController {
    var viewControllers: Binder<[UIViewController]?> {
        return Binder(self.base) { viewConroller, viewControllers in
            viewConroller.viewControllers = viewControllers
        }
    }
}
