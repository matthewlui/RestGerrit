//
//  Documentation.swift
//  RestGerrit
//
//  Created by Matthew Lui on 19/2/2018.
//  Copyright © 2018 Chatboy.xyz. All rights reserved.
//

import Foundation

/// The DocResult entity contains information about a document.
public protocol DocResult {

    /// The title of the document.
    var title: String { get set }

    /// The URL of the document.
    var url: String { get set }

}
