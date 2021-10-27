//
//  ImageViewVC.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 27/10/21.
//

import UIKit
import Kingfisher
import RxSwift

public class ImageViewVC: SZViewController {
    private let disposeBag = DisposeBag()
    
    private let viewModel: ImageViewViewModel
    public init(viewModel: ImageViewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.maximumZoomScale = 4
        scrollView.minimumZoomScale = 1
        
        scrollView.delegate = self
        self.setupBinding()
        self.viewModel.setupData()
    }

    private func setupBinding() {
        self.viewModel.outData
            .bind { [weak self] model in
                guard let url = URL(string: model.url) else { return }
                self?.imageView.kf.setImage(
                    with: url,
                    placeholder: UIImage(named: "placeholder"),
                    options: [
                        .transition(.fade(1))
                    ]
                )
                self?.title = model.title
            }.disposed(by: self.disposeBag)
    }
    public override func onFinishCoordinator() {
        self.viewModel.didFinishCoordinator.onNext(())
    }
        
}

extension ImageViewVC: UIScrollViewDelegate {
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    public func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if scrollView.zoomScale > 1 {
            if let image = imageView.image {
                let ratioW = imageView.frame.width / image.size.width
                let ratioH = imageView.frame.height / image.size.height
                
                let ratio = ratioW < ratioH ? ratioW : ratioH
                let newWidth = image.size.width * ratio
                let newHeight = image.size.height * ratio
                let conditionLeft = newWidth*scrollView.zoomScale > imageView.frame.width
                let left = 0.5 * (conditionLeft ? newWidth - imageView.frame.width : (scrollView.frame.width - scrollView.contentSize.width))
                let conditioTop = newHeight*scrollView.zoomScale > imageView.frame.height
                
                let top = 0.5 * (conditioTop ? newHeight - imageView.frame.height : (scrollView.frame.height - scrollView.contentSize.height))
                
                scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
                
            }
        } else {
            scrollView.contentInset = .zero
        }
    }
}
