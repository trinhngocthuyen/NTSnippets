//: Playground - noun: a place where people can play

import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// http://stackoverflow.com/questions/28352674/http-request-in-swift-not-working
URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)

func after(_ seconds: Double, queue: DispatchQueue = .main, execute: @escaping (Void) -> Void) {
    queue.asyncAfter(deadline: DispatchTime.now() + seconds, execute: execute)
}

func _run(execute: @escaping (Void) -> Void) {
}

func run(execute: @escaping (Void) -> Void) {
    NSLog("---------------------------------------")
    execute()
}

extension ObservableType {
    func subscribeNext(_ onNext: @escaping (Self.E) -> Void) -> Disposable {
        return subscribe(onNext: onNext)
    }
}

// Example 1: Create an observable
func example1() {
    Observable<Int>.create { observer -> Disposable in
        after(0.5) { observer.onNext(1) }
        after(1.0) { observer.onNext(2) }
        after(1.5) { observer.onCompleted() }
        return Disposables.create { NSLog("--- intObservable has been disposed") }
        }
        .subscribe { event in NSLog("intObservable1: \(event)") }
    
    Observable<Int>.from([1, 2])
        .subscribe { event in NSLog("intObservable2: \(event)") }
    Observable<Int>.interval(0.5, scheduler: MainScheduler.instance)
        .take(3, scheduler: MainScheduler.instance)
        .subscribe { event in NSLog("intObservable3: \(event)") }
    
}

func example2() {
    var counter = 1
    let observable_notShareReplay = Observable<Int>.create { (observer) -> Disposable in
        NSLog("--- Created [1]")
        counter = counter + 1
        observer.onNext(counter)
        return Disposables.create()
        }
    
    observable_notShareReplay.subscribe(onNext: { v in NSLog("\(v)") })
    observable_notShareReplay.subscribe(onNext: { v in NSLog("\(v * 10)") })
    observable_notShareReplay.subscribe(onNext: { v in NSLog("\(v * 100)") })
    
    // Conclusion: the closure (create) is invoked multiple times
    // However, sometimes we want to call it ONCE, for ex: sending a request
    
    let observable_shareReplay = Observable<Int>.create { (observer) -> Disposable in
        NSLog("--- Created [2]")
        counter = counter + 1
        observer.onNext(counter)
        return Disposables.create()
        }
        .shareReplay(1)
    
    
    
    observable_shareReplay.subscribe(onNext: { v in NSLog("\(v)") })
    observable_shareReplay.subscribe(onNext: { v in NSLog("\(v * 10)") })
    observable_shareReplay.subscribe(onNext: { v in NSLog("\(v * 100)") })
    
    // Conclusion: with shareReplay --> it's shared 
    // --> created once
}

/// Example 3: `Publish`, `connect`, `refcount`, `share`
/// http://www.tailec.com/blog/understanding-publish-connect-refcount-share
func example3() {
    let urlRequest = URLRequest(url: URL(string: "https://google.com")!)
    let requestObservable = URLSession.shared.rx.data(request: urlRequest)
        .do(onSubscribe: { _ in NSLog("--- onSubscribe") })
        .share()    // .shared = publish().refCount()
    
    requestObservable.subscribeNext { NSLog("Next [1] \($0)") }
    requestObservable.subscribeNext { NSLog("Next [2] \($0)") }
}

func example4() {
    let observable = Observable<Int>.create { (observer) -> Disposable in
        observer.onNext(1)
        observer.onNext(2)
        observer.onCompleted()
        return Disposables.create()
    }
    .do(onSubscribe: { _ in NSLog("--- onSubscribe") })
    .publish()
    
    observable.subscribeNext { NSLog("Next [1] \($0)") }
}


//example1()
//example2()
//example3()
//example4()
