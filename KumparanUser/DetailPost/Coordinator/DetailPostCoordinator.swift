//
//  DetailPostCoordinator.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 24/10/21.
//

import Foundation
public class DetailPostCoordinator: SZCoordinator {
    public let viewModel: DetailPostViewModel
    public init(viewModel: DetailPostViewModel) {
        self.viewModel =  viewModel
        super.init()
    }
    public override func start() {
        let viewController = DetailPostVC(viewModel: self.viewModel)
        self.navigation.pushViewController(viewController, animated: true)
    }
}
