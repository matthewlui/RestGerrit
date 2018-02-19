//
//  Access.swift
//  RestGerrit
//
//  Created by Matthew Lui on 19/2/2018.
//  Copyright © 2018 Chatboy.xyz. All rights reserved.
//

import Foundation

/// The AccessSectionInfo describes the access rights that are assigned on a ref.
public protocol AccessSectionInfo: Codable {

    /// The permissions assigned on the ref of this access section as a map that maps the permission names to PermissionInfo entities.
    var permissions: PermissionInfo { get set }
}

/// The PermissionInfo entity contains information about an assigned permission.
public protocol PermissionInfo: Codable {

    /// The name of the label. Not set if it’s not a label permission.
    var label: String? { get set }

    /// not set if false
    /// Whether this permission is assigned exclusively.
    var exclusive: Bool? { get set }

    /// The rules assigned for this permission as a map that maps the UUIDs of the groups for which the permission are assigned to PermissionRuleInfo entities.
    var rules: PermissionRuleInfo { get set }
}

/// The PermissionRuleInfo entity contains information about a permission rule that is assigned to group.
public protocol PermissionRuleInfo: Codable {

    /// The action of this rule. For normal permissions this can be ALLOW, DENY or BLOCK. Special values for global capabilities are INTERACTIVE and BATCH.
    var action: String { get set }

    /// Whether the force flag is set.
    var force: Bool? { get set }

    /// The min value of the permission range.
    var min: UInt? { get set }

    /// The max value of the permission range.
    var max: UInt? { get set }
}

/// The ProjectAccessInfo entity contains information about the access rights for a project.
public protocol ProjectAccessInfo: Codable {

    /// The revision of the refs/meta/config branch from which the access rights were loaded.
    var revision: String { get set }

    /// not set for the All-Project project
    /// The parent project from which permissions are inherited as a ProjectInfo entity.
    var inherits_from: ProjectInfo? { get set }

    /// The local access rights of the project as a map that maps the refs to AccessSectionInfo entities.
    var local: AccessSectionInfo { get set }

    /// not set if false
    /// Whether the calling user owns this project.
    var is_owner: Bool? { get set }

    /// The list of refs owned by the calling user.
    var owner_of: [String] { get set }

    /// not set if false
    /// Whether the calling user can upload to any ref.
    var can_upload: Bool? { get set }

    /// not set if false
    /// Whether the calling user can add any ref.
    var can_add: Bool? { get set }

    /// not set if false
    /// Whether the calling user can see the refs/meta/config branch of the project.
    var config_visible: Bool? { get set }

}
