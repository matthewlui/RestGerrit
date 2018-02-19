//
//  Actions.swift
//  RestGerrit
//
//  Created by Matthew Lui on 18/2/2018.
//  Copyright © 2018 Chatboy.xyz. All rights reserved.
//

import Foundation

public typealias HTTPMethod = String

/// The ActionInfo entity describes a REST API call the client can make to manipulate a resource. These are frequently implemented by plugins and may be discovered at runtime.
public protocol ActionInfo: Codable {

    /// HTTP method to use with the action. Most actions use POST, PUT or DELETE to cause state changes.
    var method: HTTPMethod? { get set }

    /// Short title to display to a user describing the action. In the Gerrit web interface the label is used as the text on the button presented in the UI.
    var label: String? { get set }

    /// Longer text to display describing the action. In a web UI this should be the title attribute of the element, displaying when the user hovers the mouse.
    var title: String? { get set }

    /// If true the action is permitted at this time and the caller is likely allowed to execute it. This may change if state is updated at the server or permissions are modified. Not present if false.
    var enabled: Bool? { get set }

}

/// The CherryPickInput entity contains information for cherry-picking a change to a new branch.
public protocol CherryPickInput: Codable {

    /// Commit message for the cherry-picked change
    var message: String { get set }

    /// Destination branch
    var destination: String { get set }

    /// 40-hex digit SHA-1 of the commit which will be the parent
    /// commit of the newly created change.
    /// If set, it must be a merged commit or a change revision on
    /// the destination branch.
    var base: String? { get set }

    /// Number of the parent relative to which the cherry-pick should be considered.
    var parent: String? { get set }

    /// Notify handling that defines to whom email notifications should
    /// be sent after the cherry-pick.
    /// Allowed values are NONE, OWNER, OWNER_REVIEWERS and ALL.
    /// If not set, the default is NONE.
    var notify: String? { get set }

    /// Additional information about whom to notify about the update
    /// as a map of recipient type to NotifyInfo entity.
    var notify_detail: String? { get set }

    /// If true, carries reviewers and ccs over from original change to newly created one.
    var keep_reviewers: Bool? { get set }
}

/// The FetchInfo entity contains information about how to fetch a patch set via a certain protocol.
public protocol FetchInfo: Codable {

    /// The URL of the project.
    var url: String { get set }

    /// The ref of the patch set.
    var ref: String { get set }

    /// The download commands for this patch set as a map that maps the command names to the commands.
    /// Only set if download commands are requested.
    var commands: String { get set }

}
