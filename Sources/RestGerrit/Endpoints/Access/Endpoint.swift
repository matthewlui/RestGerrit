//
//  Endpoint.swift
//  RestGerrit
//
//  Created by Matthew Lui on 19/2/2018.
//  Copyright © 2018 Chatboy.xyz. All rights reserved.
//

import Foundation

/**
 *  List Access Rights
 *  'GET /access/?project={project-name}'
 */

struct Access: Endpoint {

    static let name = "/access"
    var params = [Param]()

}

extension  Access: InternalEndpoint { }
