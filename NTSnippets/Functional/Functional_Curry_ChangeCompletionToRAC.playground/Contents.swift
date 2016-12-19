//: Playground - noun: a place where people can play

import NTFunctional
import ReactiveCocoa
import ReactiveSwift

var desc = "A demo using Currying to remove completion (closure), change it to RAC style"

struct DataPackage {
    var id: String
    init(id: String) {
        self.id = id
    }
}

func toRACStyle<A, V, E>(_ f: @escaping (A) -> ((V?, E?) -> Void) -> Void) -> (A) -> SignalProducer<V, E> {
    return { x in
        return SignalProducer { observer, disposable in
            let g = f(x); g { data, error in
                if let error = error {
                    observer.send(error: error)
                } else if let data = data {
                    observer.send(value: data)
                } else {
                    // Unexpected case
                }
            }
        }
    }
}

func downloadData(url: String, completion: (DataPackage?, NSError?) -> Void) {
    completion(DataPackage(id: "\(url) --> 12345"), nil)
    // completion(nil, NSError(domain: "download.data", code: 111, userInfo: nil))
}

let rac_download = curry(downloadData) |> toRACStyle
    <*> (url: "https://examples.com")

rac_download
    .on(value: { data in
        NSLog("Data: \(data)")
    })
    .on(failed: { error in
        NSLog("Error: \(error)")
    })
    .start()

