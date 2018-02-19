//
//  Plugin.swift
//  RestGerrit
//
//  Created by Matthew Lui on 19/2/2018.
//  Copyright © 2018 Chatboy.xyz. All rights reserved.
//

import Foundation

/// The PluginInfo entity describes a plugin.
public protocol PluginInfo: Codable {

    /// The ID of the plugin.
    var id: String { get set }

    /// The version of the plugin.
    var version: String { get set }

    /// URL of the plugin’s default page.
    var index_url: String { get set }

    /// The plugin’s filename.
    var filename: String { get set }

    /// Whether the plugin is disabled.
    var disabled: Bool? { get set }
}

/// The PluginInput entity describes a plugin that should be installed.
public protocol PluginInput: Codable {

    /// URL to the plugin jar.
    var url: String { get }
}
