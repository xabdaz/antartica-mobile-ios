//
//  DetailPostViewModel.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 24/10/21.
//

import RxSwift
import RxCocoa

public class DetailPostViewModel: SZViewModel {
    private let disposeBag = DisposeBag()
    
    let outTitle = BehaviorRelay<String?>(value: nil)
    let outDescription = BehaviorRelay<String?>(value: nil)
    let outUser = BehaviorRelay<String?>(value: nil)
    let outTable = BehaviorRelay<[CommentModel]>(value: [])

    let inTableSelected = PublishSubject<CommentModel>()
    private let restClient: BackendRestClient
    let id: Int
    public init(model: ListPostViewData, restClient: BackendRestClient) {
        self.restClient = restClient
        self.id = model.model.id ?? 0
        super.init()
        self.outTitle.accept(model.title)
        self.outUser.accept(model.user)
        self.outDescription.accept(model.description)
    }

    func getComment() {
        self.restClient.request(PostRepository.Comment(postId: id))
            .subscribe { [weak self] model in
                self?.outTable.accept(model)
            } onError: { err in
                print(err)
            }.disposed(by: self.disposeBag)

    }
}

extension DetailPostViewModel {
    private func setupBinding() {
        self.inTableSelected
            .bind { model in
                AppDelegate.container.autoregister(DetailUserViewData.self) { _ in
                    DetailUserViewData(id: model.id ?? 0)
                }
            }.disposed(by: self.disposeBag)
    }
}
