//
//  GalerPostViewModel.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 24/10/21.
//

import RxSwift
import RxCocoa
import RxDataSources

public class GalerPostViewModel: SZViewModel {
    let outGaleri = BehaviorRelay<[GalerPostViewData]>(value: [])
}
