//
//  GaleriPostVC.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 24/10/21.
//

import UIKit

public class GaleriPostVC: SZViewController {
    private let viewModel: GalerPostViewModel
    public init(viewModel: GalerPostViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
