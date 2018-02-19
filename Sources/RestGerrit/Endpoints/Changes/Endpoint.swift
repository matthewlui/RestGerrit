//
//  Endpoint.swift
//  RestGerrit
//
//  Created by Matthew Lui on 19/2/2018.
//  Copyright © 2018 Chatboy.xyz. All rights reserved.
//

import Foundation

/**
 * Preconditions:
 * Clients can request PUT to create a new resource and not overwrite
 * an existing one by adding If-None-Match: * to the request HTTP headers.
 * If the named resource already exists the server will respond with HTTP
 * 412 Precondition Failed.
 */

struct Changes: Endpoint {
    static var name: String = "/changes"

    var params: [Param]

    func add(param: Param) {

    }


    struct status: Param {
        func assembly() -> String {
            return ""
        }

        static let name = "status"
        var isOpen = true
    }

}
