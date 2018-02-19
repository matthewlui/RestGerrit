//
//  Param.swift
//  RestGerrit
//
//  Created by Matthew Lui on 16/2/2018.
//  Copyright © 2018 Chatboy.xyz. All rights reserved.
//

import Foundation

public protocol Param {

    static var name: String { get }
    func assembly() -> String

}
