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

    private let restClient: BackendRestClient
    private let session: SessionService
    public init(restClient: BackendRestClient, session: SessionService) {
        self.restClient = restClient
        self.session = session
        super.init()
    }

    func loadData() {
        self.restClient.request(PostRepository.Post())
            .flatMap { [weak self] model -> Single<[ListPostViewData]> in
                guard let `self` = self else { return .never() }
                return self.mapping(model: model)
            }.subscribe {[weak self] model in
                self?.handleModel(model: model)
            } onError: { [weak self] error in
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
                return ListPostViewData(model: item)
            }
            single(.success(items))
            return Disposables.create()
        }
    }
}
