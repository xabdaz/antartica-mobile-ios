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
    public override init() {
        super.init()
    }
}
extension UserViewModel {
    func setupData() {
        var data: [UserViewData] = []
        for id in 0 ..< 30 {
            data.append(UserViewData(name: "User \(id)"))
        }
        self.outTableView.accept(data)
    }
}
