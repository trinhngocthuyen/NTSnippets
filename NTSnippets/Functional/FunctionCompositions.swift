//
//  FunctionCompositions.swift
//  NTSnippets
//
//  Created by Thuyen Trinh on 12/18/16.
//  Copyright © 2016 Thuyen Trinh. All rights reserved.
//

import Foundation

precedencegroup NTOperatorLeft {
    associativity: left
}

precedencegroup NTOperatorRight {
    associativity: right
}

infix operator |> : NTOperatorLeft
infix operator <| : NTOperatorRight
infix operator |>? : NTOperatorLeft
infix operator <|? : NTOperatorRight

infix operator ||> : NTOperatorLeft
infix operator <|| : NTOperatorRight
infix operator ||>? : NTOperatorLeft
infix operator <||? : NTOperatorRight

infix operator >>> : NTOperatorLeft
infix operator <<< : NTOperatorRight
infix operator >>>? : NTOperatorLeft

infix operator <*> : NTOperatorLeft

/// Apply a value `x` to a function `f`.
/// This operator is left associative.
public func |> <A, B> (x: A, f: (A) -> B) -> B {
    return f(x)
}

/// Apply a value `x` to a function `f`. 
/// Similar to operator `|>`, but the params are in the reversed order.
/// This operator is right associative.
public func <| <A, B> (f: (A) -> B, x: A) -> B {
    return x |> f
}

/// Apply an array of values `xs` to a function `f`.
/// This operator is left associative.
public func ||> <A, B> (xs: [A], f: (A) -> B) -> [B] {
    return xs.map(f)
}

/// Apply an array of values `xs` to a function `f`. 
/// Similar to operator `||>`, but the params are in the reversed order.
/// This operator is right associative.
public func <|| <A, B> (f: (A) -> B, xs: [A]) -> [B] {
    return xs ||> f
}

/// Apply an optional value `x` to a function `f`. If `x` is nil, it yields a nil.
/// This operator is left associative.
public func |>? <A, B> (x: A?, f: (A) -> B) -> B? {
    return x.map(f)
}

/// Apply an optional value `x` to a function `f`. If `x` is nil, it yields a nil.
/// This operator is left associative.
public func |>? <A, B> (x: A?, f: (A) -> B?) -> B? {
    return x.flatMap(f)
}

/// Apply an optional value `x` to a function `f`. If `x` is nil, it yields a nil.
/// This operator is right associative.
public func <|? <A, B> (f: (A) -> B, x: A?) -> B? {
    return x |>? f
}

/// Apply an optional value `x` to a function `f`. If `x` is nil, it yields a nil.
/// This operator is right associative.
public func <|? <A, B> (f: (A) -> B?, x: A?) -> B? {
    return x |>? f
}

/// Combine 2 functions `f` and `g`. The input of `g` takes the output of `f` as its input.
/// This operator is left associative.
public func >>> <A, B, C> (f: @escaping (A) -> B, g: @escaping (B) -> C) -> (A) -> C {
    return { x in g(f(x)) }
}

/// Combine 2 functions `f` and `g`. The input of `g` takes the output of `f` (even if it's nil) as its input.
/// This operator is left associative.
public func >>>? <A, B, C> (f: @escaping (A) -> B?, g: @escaping (B) -> C) -> (A) -> C? {
    return { x in f(x).map(g) }
}

/// Combine 2 functions `f` and `g`. The input of `g` takes the output of `f` (even if it's nil) as its input.
/// This operator is left associative.
public func >>>? <A, B, C> (f: @escaping (A) -> B?, g: @escaping (B) -> C?) -> (A) -> C? {
    return { x in f(x).flatMap(g) }
}

/// Apply a value `x` to a function `f`.
/// The same as operator `<|`, but left associative (while `<|` is right associative)
public func <*> <A, R> (f: (A) -> R, a: A) -> R {
    return a |> f
}
