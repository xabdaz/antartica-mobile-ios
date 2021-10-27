//
//  AlbumViewModel.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 27/10/21.
//

import Foundation
import RxSwift
import RxCocoa

public class AlbumViewModel: SZViewModel {

    private let disposeBag = DisposeBag()

    let outTableView = BehaviorRelay<[AlbumViewData]>(value: [])
    
    private let restClient: BackendRestClient
    public init(restClient: BackendRestClient) {
        self.restClient = restClient
    }

    func getAlbum(id: Int) {
        self.restClient.request(PostRepository.Albums(userId: id))
            .subscribe { [weak self] model in
                self?.handleModel(model: model)
            } onError: { error in
                Logger.error(error.localizedDescription)
            }.disposed(by: self.disposeBag)
    }

    private func handleModel(model: [AlbumModel]) {
        let viewData = model.map { AlbumViewData(model: $0) }
        self.outTableView.accept(viewData)
    }
}
