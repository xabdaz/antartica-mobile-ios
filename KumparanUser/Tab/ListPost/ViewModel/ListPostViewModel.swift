//
//  ListPostViewModel.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 23/10/21.
//

import RxCocoa
import RxSwift
import RxDataSources

public class ListPostViewModel: SZViewModel {
    let didDetail = PublishSubject<Void>()
    private let disposeBag = DisposeBag()
    
    typealias SectionData = SZSectionSection<ListPostViewData>
    let outTabelData = BehaviorRelay<[SectionModel<String, SectionData>]>(value: [])

    let inTableSelected = PublishSubject<SectionData>()

    private let restClient: BackendRestClient
    private let session: SessionService
    public init(restClient: BackendRestClient, session: SessionService) {
        self.restClient = restClient
        self.session = session
        super.init()
        self.setupInputBindings()
    }

    func loadData() {
        self.restClient.request(PostRepository.Post())
            .flatMap { [weak self] model -> Single<[ListPostViewData]> in
                guard let `self` = self else { return .never() }
                return self.mapping(model: model)
            }.subscribe {[weak self] model in
                guard let `self` = self else { return }
                self.handleModel(model: model)
            } onError: { error in
                print(error)
            }.disposed(by: self.disposeBag)
    }

    private func handleModel(model: [ListPostViewData]) {
        let item = model.map { return SectionData.item($0, identifier: "ListPostCell") }
        let section: [SectionModel<String, SectionData>] = [SectionModel<String, SectionData>(model: "", items: item)]
        self.outTabelData.accept(section)
    }

    private func mapping(model: [PostModel]) -> Single<[ListPostViewData]> {
        return Single<[ListPostViewData]>.create { [weak self] single in
            guard let `self` = self else { return Disposables.create() }
            let items = model.map { item -> ListPostViewData in
                let userItem = self.session.users ?? []
                let data = ListPostViewData(model: item, user: userItem)
                return data
            }
            single(.success(items))
            return Disposables.create()
        }
    }
}

extension ListPostViewModel {
    func setupInputBindings() {
        self.inTableSelected
            .bind { item in
                switch item {
                case let .item(model, identifier: _):
                    AppDelegate.container.register(ListPostViewData.self) { _ in model}
                default: break
                }
            }.disposed(by: self.disposeBag)
    }
}
