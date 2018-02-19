//
//  Group.swift
//  RestGerrit
//
//  Created by Matthew Lui on 19/2/2018.
//  Copyright © 2018 Chatboy.xyz. All rights reserved.
//

import Foundation

/*
    The type of a group can be deduced from the group’s UUID:
    UUID matches "^[0-9a-f]{40}$"
    Gerrit internal group
    UUID starts with "global:"
    Gerrit system group
    UUID starts with "ldap:"
    LDAP group
    UUID starts with "<prefix>:"
    other external group
 */

/// The GroupAuditEventInfo entity contains information about an audit event of a group.
public protocol GroupAuditEventInfo: Codable {

    /// The group member that is added/removed. If type is ADD_USER or REMOVE_USER the member is returned as detailed AccountInfo entity, if type is ADD_GROUP or REMOVE_GROUP the member is returned as GroupInfo entity.
    var member: AccountInfo { get set }

    /// The event type, can be: ADD_USER, REMOVE_USER, ADD_GROUP or REMOVE_GROUP.
    ///
    /// ADD_USER: A user was added as member to the group.
    ///
    /// REMOVE_USER: A user member was removed from the group.
    ///
    /// ADD_GROUP: A group was included as member in the group.
    ///
    /// REMOVE_GROUP: An included group was removed from the group.
    var type: String { get set }

    /// The user that did the add/remove as detailed AccountInfo entity.
    var user: AccountInfo { get set }

    /// The timestamp of the event.
    var date: Date { get set }
}

/// The GroupInfo entity contains information about a group. This can be a Gerrit internal group, or an external group that is known to Gerrit.
public protocol GroupInfo: Codable {

    /// The URL encoded UUID of the group.
    var id: String { get set }

    /// not set if returned in a map where the group name is used as map key
    /// The name of the group.
    var name: String { get set }

    /// URL to information about the group. Typically a URL to a web page that permits users to apply to join the group, or manage their membership.
    var url: String? { get set }

    /// REMARK: Original api doc wrong
    /// Options of the group
    var options: GroupOptionsInfo { get set }

    /// only for internal groups
    /// The description of the group.
    var description: String? { get set }

    /// only for internal groups
    /// The numeric ID of the group.
    var group_id: String? { get set }

    /// only for internal groups
    /// The name of the owner group.
    var owner: String? { get set }

    /// only for internal groups
    /// The URL encoded UUID of the owner group.
    var owner_id: String? { get set }

    /// only for internal groups
    /// The timestamp of when the group was created.
    var created_on: Date? { get set }

    /// optional, only for internal groups, not set if false
    /// Whether the query would deliver more results if not limited.
    /// Only set on the last group that is returned by a group query.
    var _more_groups: [String]? { get set }

    /// optional, only for internal groups
    /// A list of AccountInfo entities describing the direct members.
    /// Only set if members are requested.
    var members: [AccountInfo]? { get set }

    /// optional, only for internal groups
    /// A list of GroupInfo entities describing the direct subgroups.
    /// Only set if subgroups are requested.
    var includes: [GroupInfo]? { get set }
}

/// The 'GroupInput' entity contains information for the creation of a new internal group.
public protocol GroupInput: Codable {

    /// The name of the group (not encoded).
    /// If set, must match the group name in the URL.
    var name: String? { get set }

    /// The description of the group.
    var description: String? { get set }

    /// Whether the group is visible to all registered users.
    /// false if not set.
    var visible_to_all: Bool? { get set }

    /// The URL encoded ID of the owner group.
    /// This can be a group UUID, a legacy numeric group ID or a unique group name.
    /// If not set, the new group will be self-owned.
    var owner_id: String? { get set }

    /// The initial members in a list of
    /// account ids.
    var members: [String]? { get set }
}

/// Options of the group.
public protocol GroupOptionsInfo: Codable {

    /// not set if false
    /// Whether the group is visible to all registered users.
    var visible_to_all: Bool? { get set }
}

// TODO: Consider to make it an aliase type to GroupOptionsInfo
//       But consider the consistency accross whole project.
/// New options for a group.
public protocol GroupOptionsInput: Codable {

    /// not set if false
    /// Whether the group is visible to all registered users.
    var visible_to_all: Bool? { get set }
}

/// The GroupsInput entity contains information about groups that should be included into a group or that should be deleted from a group.
public protocol GroupsInput: Codable {

    /// The id of one group that should be included or deleted.
    var _one_group: String? { get set }

    /// A list of group ids that identify the groups that should be included or deleted.
    var groups: [String]? { get set }
}

/// The MembersInput entity contains information about accounts that should be added as members to a group or that should be deleted from the group.
public protocol MembersInput: Codable {

    /// The id of one account that should be added or deleted.
    var _one_member: String? { get set }

    /// A list of account ids that identify the accounts that should be added or deleted.
    var members: String? { get set }
}
