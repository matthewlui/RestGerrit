//
//  Endpoint.swift
//  RestGerrit
//
//  Created by Matthew Lui on 16/2/2018.
//  Copyright © 2018 Chatboy.xyz. All rights reserved.
//

import Foundation

public protocol Endpoint {

    static var name: String { get }

    var params: [Param] { get }

    mutating func add(param: Param)

}

internal protocol InternalEndpoint {
    var params: [Param] { get set }
}

extension InternalEndpoint {
    mutating func add(param: Param) {
        params.append(param)
    }
}