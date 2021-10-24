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
    
    typealias SectionData = SZSectionSection<ListPostViewData>
    let outTabelData = BehaviorRelay<[SectionModel<String, SectionData>]>(value: [])

    public override init() {
        super.init()
    }

    func loadData() {
        var data: [SectionModel<String, SectionData>] = []
        let item = [
            SectionData.item(ListPostViewData(id: "Hai"), identifier: "ListPostCell"),
            SectionData.item(ListPostViewData(id: "Hai"), identifier: "ListPostCell"),
            SectionData.item(ListPostViewData(id: "Hai"), identifier: "ListPostCell")
        ]

        data.append(SectionModel<String, SectionData>(model: "", items: item))
        outTabelData.accept(data)
    }
}
