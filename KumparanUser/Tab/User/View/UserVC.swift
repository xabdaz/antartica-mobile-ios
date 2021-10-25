//
//  UserVC.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 26/10/21.
//

import UIKit

public class UserVC: SZViewController {

    private let viewModel: UserViewModel
    public init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }

}
