//
//  SessionService.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 23/10/21.
//

import RxSwift
import RxCocoa

public class SessionService {
    
    public let didUser = PublishSubject<[UserModel]>()
    private let disposeBag = DisposeBag()
    
    private let restClient: BackendRestClient
    private let dataManager: DataManager
    private(set) var users: [UserModel]?

    init(restClient: BackendRestClient, dataManager: DataManager) {
        self.restClient = restClient
        self.dataManager = dataManager
    }
    
    public func fetchSession() {
        users = dataManager.get(key: SettingKey.users, type: [UserModel].self)
        if let user = users {
            self.didUser.onNext(user)
        } else {
            self.loadFromRemote()
        }
    }

    func loadFromRemote() {
        self.restClient.request(PostRepository.User()).threadIO()
            .subscribe { [weak self] model in
                self?.dataManager.set(key: SettingKey.users, value: model)
                self?.fetchSession()
            } onError: { error in
                print(error)
            }.disposed(by: self.disposeBag)

    }
}
