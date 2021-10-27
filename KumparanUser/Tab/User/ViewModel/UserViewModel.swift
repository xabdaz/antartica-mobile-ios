//
//  UserViewModel.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 26/10/21.
//

import RxSwift
import RxCocoa
public class UserViewModel: SZViewModel {
    let outTableView = BehaviorRelay<[UserViewData]>(value: [])
    private let session: SessionService
    public init(session: SessionService) {
        self.session = session
        super.init()
    }
}
extension UserViewModel {
    func setupData() {
        if let users = self.session.users {
            let users = users.map { UserViewData(model: $0) }
            self.outTableView.accept(users)
        }
    }
}
