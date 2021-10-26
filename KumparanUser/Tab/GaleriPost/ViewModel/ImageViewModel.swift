//
//  ImageViewModel.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 27/10/21.
//

import RxSwift
import RxCocoa

public class ImageViewModel: SZViewModel {
    private let disposeBag = DisposeBag()
    public let outTableView = BehaviorRelay<[PhotoModel]>(value: [])
    
    let restClient: BackendRestClient
    init(restClient: BackendRestClient) {
        self.restClient = restClient
        super.init()
    }

    func getPhotos(albumId: Int) {
        self.restClient.request(PostRepository.Photo(albumId: albumId))
            .subscribe { [weak self] model in
                self?.outTableView.accept(model)
            } onError: { error in
                Logger.error(error.localizedDescription)
            }.disposed(by: self.disposeBag)
    }
}
