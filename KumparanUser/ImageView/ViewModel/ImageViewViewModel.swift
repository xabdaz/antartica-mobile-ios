//
//  ImageViewViewModel.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 27/10/21.
//

import RxSwift
public class ImageViewViewModel: SZViewModel {
    let outData = PublishSubject<ImageViewData>()
    private let model: ImageViewData
    public init(model: ImageViewData) {
        self.model = model
    }

    func setupData() {
        self.outData.onNext(model)
    }
}
