//
//  TabViewModel.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 24/10/21.
//

import RxSwift
import RxCocoa
import UIKit

public class TabViewModel: SZViewModel {
    let didViewController = BehaviorRelay<[UIViewController]>(value: [])
}
