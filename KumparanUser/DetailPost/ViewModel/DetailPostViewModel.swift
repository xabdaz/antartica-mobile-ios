//
//  DetailPostViewModel.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 24/10/21.
//

import Foundation
import RxRelay
public class DetailPostViewModel: SZViewModel {
    let outTitle = BehaviorRelay<String>(value: "")
    public init(model: ListPostViewData) {
        super.init()
//        outTitle.accept(model.id)
    }
}
