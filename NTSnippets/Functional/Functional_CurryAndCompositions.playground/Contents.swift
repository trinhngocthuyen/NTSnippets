//: Playground - noun: a place where people can play

import NTFunctional

var str = "Hello, playground"

/// MARK: - Currying
/// ---------------------------------------------------------------
func downloadData(url: String, params: [String: Any]) {
    NSLog("Download data. url: \(url). params: \(params)")
}

curry(downloadData)
    <*> "https://example.com"
    <*> ["offset": 0, "limit": 50]

curry(downloadData)
    <*> (url: "https://example.com")
    <*> (params: ["offset": 50, "limit": 50])

/// MARK: - Composition
/// ---------------------------------------------------------------
struct User { }
struct JSON { }

func parseJSON(json: JSON) -> User? { return User() }
func loadJSON() -> JSON? { return JSON() }


// C1: Left Associative: read from left to right
let _user = () |> loadJSON |>? parseJSON

// C2: Right Associative: read from right to left
let _user2 = parseJSON <|? loadJSON <| ()

// C3: Both (left + right) associative
let _user3 = (loadJSON >>>? parseJSON) <| ()

/// MARK: - Discussion
/// ---------------------------------------------------------------
/*
 - C1 & C2: calculate the value chainingly through different functions
 - C3: calculate the final function first, then apply the value
*/
