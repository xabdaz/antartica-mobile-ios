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
    
    let outTableView = BehaviorRelay<[UserViewData]>(value: [])
    private let session: SessionService
    public init(session: SessionService) {
        self.session = session
        super.init()
    }
}
extension GaleriPostViewModel {
    func setupData() {
        if let users = self.session.users {
            let users = users.map { UserViewData(model: $0) }
            self.outTableView.accept(users)
        }
    }
}
