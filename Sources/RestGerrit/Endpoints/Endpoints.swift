//
//  Endpoint.swift
//  RestGerrit
//
//  Created by Matthew Lui on 16/2/2018.
//  Copyright © 2018 Chatboy.xyz. All rights reserved.
//

import Foundation

typealias Query = String

enum GerritEndpoint: String {

    /**
      * List Access Rights
      * 'GET /access/?project={project-name}'
      */
    case access
    case accounts
    case changes
    case config, groups, plugins
    case projects, Documentation

}
