//
//  SZViewController.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 23/10/21.
//

import UIKit

open class SZViewController: UIViewController {
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let bundle = Bundle(for: type(of: self))
        super.init(nibName: nibNameOrNil ?? bundle.description, bundle: nibBundleOrNil ?? Bundle.main)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
