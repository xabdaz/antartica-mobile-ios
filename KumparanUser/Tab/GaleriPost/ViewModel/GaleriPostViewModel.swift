//
//  GalerPostViewModel.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 24/10/21.
//

import RxSwift
import RxCocoa
import RxDataSources

public class GaleriPostViewModel: SZViewModel {
    private let disposeBag = DisposeBag()
    
    let outTableView = BehaviorRelay<[UserViewData]>(value: [])
    let inImageData = PublishSubject<ImageViewData>()
    private let session: SessionService
    public init(session: SessionService) {
        self.session = session
        super.init()

        setupBinding()
    }
}
extension GaleriPostViewModel {
    func setupData() {
        if let users = self.session.users {
            let users = users.map { UserViewData(model: $0) }
            self.outTableView.accept(users)
        }
    }

    func setupBinding() {
        self.inImageData
            .bind { model in
                AppDelegate.container.autoregister(ImageViewData.self) { _ in
                    model
                }
            }.disposed(by: self.disposeBag)
    }
}
