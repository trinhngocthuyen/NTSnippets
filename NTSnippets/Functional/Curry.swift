//
//  Curry.swift
//  NTSnippets
//
//  Created by Thuyen Trinh on 12/18/16.
//  Copyright © 2016 Thuyen Trinh. All rights reserved.
//

import Foundation

public func curry<A, B, R>(_ f: @escaping (A, B) -> R) -> (A) -> (B) -> R {
    return { a in { b in f(a, b) } }
}

public func curry<A, B, C, R>(_ f: @escaping (A, B, C) -> R) -> (A) -> (B) -> (C) -> R {
    return { a in { b in { c in f(a, b, c) } } }
}

public func curry<A, B, C, D, R>(_ f: @escaping (A, B, C, D) -> R) -> (A) -> (B) -> (C) -> (D) -> R {
    return { a in { b in { c in { d in f(a, b, c, d) } } } }
}

public func curry<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R) -> (A) -> (B) -> (C) -> (D) -> (E) -> R {
    return { a in { b in { c in { d in { e in f(a, b, c, d, e) } } } } }
}

public func curry<A, B, C, D, E, F, R>(_ f: @escaping (A, B, C, D, E, F) -> R) -> (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> R {
    return { a in { b in { c in { d in { e in { _f in f(a, b, c, d, e, _f) } } } } } }
}

public func curry<A, B, C, D, E, F, G, R>(_ f: @escaping (A, B, C, D, E, F, G) -> R) -> (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> R {
    return { a in { b in { c in { d in { e in { _f in { g in f(a, b, c, d, e, _f, g) } } } } } } }
}

public func curry<A, B, C, D, E, F, G, H, R>(_ f: @escaping (A, B, C, D, E, F, G, H) -> R) -> (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> R {
    return { a in { b in { c in { d in { e in { _f in { g in { h in f(a, b, c, d, e, _f, g, h) } } } } } } } }
}
