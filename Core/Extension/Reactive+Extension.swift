//
//  Reactive+Extension.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 27/10/21.
//

import RxSwift
import RxCocoa
extension PrimitiveSequence {
    public func threadIO() -> PrimitiveSequence {
        return self
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.asyncInstance)
    }
    
    public func mainThreadAsync() -> PrimitiveSequence {
        return self.observeOn(MainScheduler.asyncInstance)
    }
    
    public func computing() -> PrimitiveSequence {
        return self.subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
    }
}

extension ObservableType {
    public func threadIO() -> Observable<Self.Element> {
        return self
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.asyncInstance)
    }
    
    public func mainThreadAsync() -> Observable<Self.Element> {
        return self.observeOn(MainScheduler.asyncInstance)
    }
    
    public func computing() -> Observable<Self.Element> {
        return self.subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
    }
    
    public func backgroundJob() -> Observable<Self.Element> {
        return self.subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(ConcurrentDispatchQueueScheduler(qos: .background))
    }
}
