//
//  Project.swift
//  RestGerrit
//
//  Created by Matthew Lui on 19/2/2018.
//  Copyright © 2018 Chatboy.xyz. All rights reserved.
//

import Foundation

/// The AccessCheckInfo entity is the result of an access check.
public protocol AccessCheckInfo: Codable {

    /// The HTTP status code for the access. 200 means success, 403 means denied and 404 means the project does not exist.
    var status: UInt { get set }

    /// A clarifying message if status is not 200.
    var message: String? { get set }
}

/// The AccessCheckInput entity is either an account or (account, ref) tuple for which we want to check access.
public protocol AccessCheckInput: Codable {

    /// The account for which to check access
    var account: String { get set }

    /// The refname for which to check access
    var ref: String? { get set }
}

/// The BanInput entity contains information for banning commits in a project.
public protocol BanInput: Codable {

    /// List of commits to be banned.
    var commits: [String] { get set }

    /// Reason for banning the commits.
    var reason: String? { get set }
}

/// The BanResultInfo entity describes the result of banning commits.
public protocol BanResultInfo: Codable {

    /// List of newly banned commits.
    var newly_banned: [String]? { get set }

    /// List of commits that were already banned.
    var already_banned: [String]? { get set }

    /// List of object IDs that were ignored.
    var ignored: [String]? { get set }
}

/// The BranchInfo entity contains information about a branch.
public protocol BranchInfo: Codable {

    /// The ref of the branch.
    var ref: String { get set }

    /// The revision to which the branch points.
    var revision: String { get set }

    /// false if not set
    /// Whether the calling user can delete this branch.
    var can_delete: Bool? { get set }

    /// Links to the branch in external sites as a list of WebLinkInfo entries.
    var web_links: [WebLinkInfo]? { get set }
}

/// The BranchInput entity contains information for the creation of a new branch.
public protocol BranchInput: Codable {

    /// The name of the branch. The prefix refs/heads/ can be omitted.
    /// If set, must match the branch ID in the URL.
    var ref: String? { get set }

    /// The base revision of the new branch.
    /// If not set, HEAD will be used as base revision.
    var revision: String? { get set }
}

/// The ConfigInfo entity contains information about the effective project configuration.
public protocol ConfigInfo: Codable {

    /// The description of the project.
    var description: String? { get set }

    /// InheritedBooleanInfo that tells whether authors must complete a contributor agreement on the site before pushing any commits or changes to this project.
    var use_contributor_agreements: InheritedBooleanInfo? { get set }

    /// InheritedBooleanInfo that tells whether Gerrit will try to perform a 3-way merge of text file content when a file has been modified by both the destination branch and the change being submitted. This option only takes effect if submit type is not FAST_FORWARD_ONLY.
    var use_content_merge: InheritedBooleanInfo? { get set }

    /// InheritedBooleanInfo that tells whether each change must contain a Signed-off-by line from either the author or the uploader in the commit message.
    var use_signed_off_by: InheritedBooleanInfo? { get set }

    /// InheritedBooleanInfo that tells whether a new change is created for every commit not in target branch.
    var create_new_change_for_all_not_in_target: InheritedBooleanInfo? { get set }

    /// InheritedBooleanInfo that tells whether a valid Change-Id footer in any commit uploaded for review is required. This does not apply to commits pushed directly to a branch or tag.
    var require_change_id: InheritedBooleanInfo? { get set }

    /// optional, not set if signed push is disabled
    /// InheritedBooleanInfo that tells whether signed push validation is enabled on the project.
    var enable_signed_push: InheritedBooleanInfo? { get set }

    /// optional, not set if signed push is disabled
    /// InheritedBooleanInfo that tells whether signed push validation is required on the project.
    var require_signed_push: InheritedBooleanInfo? { get set }

    /// InheritedBooleanInfo that tells whether implicit merges should be rejected on changes pushed to the project.
    var reject_implicit_merges: InheritedBooleanInfo? { get set }

    /// InheritedBooleanInfo that tells whether all new changes are set as private by default.
    var private_by_default: InheritedBooleanInfo { get set }

    /// The max object size limit of this project as a MaxObjectSizeLimitInfo entity.
    var max_object_size_limit: MaxObjectSizeLimitInfo { get set }

    /// The default submit type of the project, can be MERGE_IF_NECESSARY, FAST_FORWARD_ONLY, REBASE_IF_NECESSARY, REBASE_ALWAYS, MERGE_ALWAYS or CHERRY_PICK.
    var submit_type: String { get set }

    /// InheritedBooleanInfo that indicates whether a change’s author date will be changed to match its submitter date upon submit.
    var match_author_to_committer_date: InheritedBooleanInfo? { get set }

    /// The state of the project, can be ACTIVE, READ_ONLY or HIDDEN.
    /// Not set if the project state is ACTIVE.
    var state: String? { get set }

    /// Map with the comment link configurations of the project. The name of the comment link configuration is mapped to the comment link configuration, which has the same format as the commentlink section of gerrit.config.
    var commentlinks: [String: String] { get set }

    /// The theme that is configured for the project as a ThemeInfo entity.
    var theme: ThemeInfo? { get set }

    /// Plugin configuration as map which maps the plugin name to a map of parameter names to ConfigParameterInfo entities.
    var plugin_config: ConfigParameterInfo { get set }

    /// Actions the caller might be able to perform on this project. The information is a map of view names to ActionInfo entities.
    var actions: ActionInfo? { get set }

}

/// The ConfigInput entity describes a new project configuration.
public protocol ConfigInput: Codable {

    /// The new description of the project.
    /// If not set, the description is removed.
    var description: String? { get set }

    /// Whether authors must complete a contributor agreement on the site before pushing any commits or changes to this project.
    /// Can be TRUE, FALSE or INHERIT.
    /// If not set, this setting is not updated.
    var use_contributor_agreements: String? { get set }

    /// Whether Gerrit will try to perform a 3-way merge of text file content when a file has been modified by both the destination branch and the change being submitted. This option only takes effect if submit type is not FAST_FORWARD_ONLY.
    /// Can be TRUE, FALSE or INHERIT.
    /// If not set, this setting is not updated.
    var use_content_merge: String? { get set }

    /// Whether each change must contain a Signed-off-by line from either the author or the uploader in the commit message.
    /// Can be TRUE, FALSE or INHERIT.
    /// If not set, this setting is not updated.
    var use_signed_off_by: String? { get set }

    /// Whether a new change will be created for every commit not in target branch.
    /// Can be TRUE, FALSE or INHERIT.
    /// If not set, this setting is not updated.
    var create_new_change_for_all_not_in_target: String? { get set }

    /// Whether a valid Change-Id footer in any commit uploaded for review is required. This does not apply to commits pushed directly to a branch or tag.
    /// Can be TRUE, FALSE or INHERIT.
    /// If not set, this setting is not updated.
    var require_change_id: String? { get set }

    /// Whether a check for implicit merges will be performed when changes are pushed for review.
    /// Can be TRUE, FALSE or INHERIT.
    /// If not set, this setting is not updated.
    var reject_implicit_merges: String? { get set }

    /// The max object size limit of this project as a MaxObjectSizeLimitInfo entity.
    /// If set to 0, the max object size limit is removed.
    /// If not set, this setting is not updated.
    var max_object_size_limit: MaxObjectSizeLimitInfo? { get set }

    /// The default submit type of the project, can be MERGE_IF_NECESSARY, FAST_FORWARD_ONLY, REBASE_IF_NECESSARY, REBASE_ALWAYS, MERGE_ALWAYS or CHERRY_PICK.
    /// If not set, the submit type is not updated.
    var submit_type: String? { get set }

    /// The state of the project, can be ACTIVE, READ_ONLY or HIDDEN.
    /// Not set if the project state is ACTIVE.
    /// If not set, the project state is not updated.
    var state: String? { get set }

    /// Plugin configuration values as map which maps the plugin name to a map of parameter names to values.
    var plugin_config_values: [String: String]? { get set }

}

/// The ConfigParameterInfo entity describes a project configuration parameter.
public protocol ConfigParameterInfo: Codable {

    /// The display name of the configuration parameter.
    var display_name: String? { get set }

    /// The description of the configuration parameter.
    var description: String? { get set }

    /// Warning message for the configuration parameter.
    var warning: String? { get set }

    /// The type of the configuration parameter. Can be STRING, INT, LONG, BOOLEAN, LIST or ARRAY.
    var type: String { get set }

    /// The value of the configuration parameter as string. If the parameter is inheritable this is the effective value which is deduced from configured_value and inherited_value.
    var value: String { get set }

    /// The list of values. Only set if the type is ARRAY.
    var values: String { get set }

    /// false if not set
    /// Whether the value is editable.
    var editable: Bool? { get set }

    /// The list of permitted values. Only set if the type is LIST.
    var permitted_values: String { get set }

    /// false if not set
    /// Whether the configuration parameter can be inherited.
    var inheritable: Bool? { get set }

    /// The value of the configuration parameter that is configured on this project, only set if inheritable is true.
    var configured_value: String? { get set }

    /// TODO: Check Type
    /// The inherited value of the configuration parameter, only set if inheritable is true.
    var inherited_value: String? { get set }

}

/// The DashboardInfo entity contains information about a project dashboard.
public protocol DashboardInfo: Codable {

    /// The ID of the dashboard. The ID has the format '<ref>:<path>', where ref and path are URL encoded.
    var id: String { get set }

    /// The name of the project for which this dashboard is returned.
    var project: String { get set }

    /// The name of the project in which this dashboard is defined. This is different from project if the dashboard is inherited from a parent project.
    var defining_project: String { get set }

    /// The name of the ref in which the dashboard is defined, without the refs/meta/dashboards/ prefix, which is common for all dashboard refs.
    var ref: String { get set }

    /// The path of the file in which the dashboard is defined.
    var path: String { get set }

    /// The description of the dashboard.
    var description: String? { get set }

    /// Subquery that applies to all sections in the dashboard.
    /// Tokens such as ${project} are not resolved.
    var foreach: String? { get set }

    /// The URL under which the dashboard can be opened in the Gerrit Web UI.
    /// The URL is relative to the canonical web URL.
    /// Tokens in the queries such as ${project} are resolved.
    var url: String { get set }

    /// not set if false
    /// Whether this is the default dashboard of the project.
    var is_default: Bool? { get set }

    /// The title of the dashboard.
    var title: String? { get set }

    /// The list of sections in the dashboard.
    var sections: [String] { get set }
}

/// The DashboardInput entity contains information to create/update a project dashboard.
public protocol DashbaordInput: Codable {

    /// URL encoded ID of a dashboard to which this dashboard should link to.
    var id: String? { get set }

    /// Message that should be used to commit the change of the dashboard.
    var commit_message: String? { get set }
}

/// The DashboardSectionInfo entity contains information about a section in a dashboard.
public protocol DashboardSectionInfo: Codable {

    /// The title of the section.
    var name: String { get set }

    /// The query of the section.
    /// Tokens such as ${project} are not resolved.
    var query: String { get set }

}

/// The DeleteBranchesInput entity contains information about branches that should be deleted.
public protocol DeleteBranchesInput: Codable {

    /// A list of branch names that identify the branches that should be deleted.
    var branched: [String] { get set }
}

/// The DeleteTagsInput entity contains information about tags that should be deleted.
public protocol DeleteTagsInput: Codable {

    /// A list of tag names that identify the tags that should be deleted.
    var tags: [String] { get set }
}

/// The GCInput entity contains information to run the Git garbage collection.
public protocol GCInput: Codable {

    /// false if not set
    /// Whether progress information should be shown.
    var show_progress: Bool? { get set }

    /// false if not set
    /// Whether an aggressive garbage collection should be done.
    var agressive: Bool? { get set }

    /// false if not set
    /// Whether the garbage collection should run asynchronously.
    var async: Bool? { get set }
}

/// The HeadInput entity contains information for setting HEAD for a project.
public protocol HeadInput: Codable {

    /// The ref to which HEAD should be set, the refs/heads prefix can be omitted.
    var ref: String { get set }
}

/// A boolean value that can also be inherited.
public protocol InheritedBooleanInfo: Codable {

    /// The effective boolean value.
    var value: Bool { get set }

    /// The configured value, can be TRUE, FALSE or INHERITED.
    var configured_value: String { get set }

    /// The boolean value inherited from the parent.
    /// Not set if there is no parent.
    var inherited_value: Bool? { get set }
}

/// The LabelTypeInfo entity contains metadata about the labels that a project has.
public protocol LabelTypeInfo: Codable {

    /// Map of the available values to their description.
    var values: [String: String] { get set }

    /// The default value of this label.
    var default_value: String { get set }
}

/// The MaxObjectSizeLimitInfo entity contains information about the max object size limit of a project.
public protocol MaxObjectSizeLimitInfo: Codable {

    /// The effective value of the max object size limit as a formatted string.
    /// Not set if there is no limit for the object size.
    var value: UInt? { get set }

    /// The max object size limit that is configured on the project as a formatted string.
    /// Not set if there is no limit for the object size configured on project level.
    var connfigured_value: UInt? { get set }

    /// The max object size limit that is inherited as a formatted string.
    /// Not set if there is no global limit for the object size.
    var inherited_value: UInt? { get set }
}

/// The ProjectAccessInput describes changes that should be applied to a project access config.
public protocol ProjectAccessInput: Codable {

    /// A list of deductions to be applied to the project access as ProjectAccessInfo entities.
    var remove: ProjectAccessInfo? { get set }

    /// A list of additions to be applied to the project access as ProjectAccessInfo entities.
    var add: ProjectAccessInfo? { get set }

    /// A commit message for this change.
    var message: String? { get set }

    /// A new parent for the project to inherit from. Changing the parent project requires administrative privileges.
    var parent: String? { get set }
}

/// The ProjectDescriptionInput entity contains information for setting a project description.
public protocol ProjectDescriptionInput: Codable {

    /// The project description.
    /// The project description will be deleted if not set.
    var description: String? { get set }

    /// Message that should be used to commit the change of the project description in the project.config file to the refs/meta/config branch.
    var commit_message: String? { get set }
}

/// The ProjectInfo entity contains information about a project.
public protocol ProjectInfo: Codable {

    /// The URL encoded project name.
    var id: String { get set }

    /// not set if returned in a map where the project name is used as map key
    /// The name of the project.
    var name: String? { get set }

    /// The name of the parent project.
    /// ?-<n> if the parent project is not visible (<n> is a number which is increased for each non-visible project).
    var parent: String? { get set }

    /// The description of the project.
    var description: String? { get set }

    /// ACTIVE, READ_ONLY or HIDDEN.
    var state: String? { get set }

    /// Map of branch names to HEAD revisions.
    var branches: [String: String]? { get set }

    /// Map of label names to LabelTypeInfo entries. This field is filled for Create Project and Get Project calls.
    var labels: [String]? { get set }

    /// Links to the project in external sites as a list of WebLinkInfo entries.
    var web_links: [WebLinkInfo]? { get set }
}

/// The ProjectInput entity contains information for the creation of a new project
public protocol ProjectInput: Codable {

    /// The name of the project (not encoded).
    /// If set, must match the project name in the URL.
    /// If name ends with .git the suffix will be automatically removed.
    var name: String? { get set }

    /// The name of the parent project.
    /// If not set, the All-Projects project will be the parent project.
    var parent: String? { get set }

    /// The description of the project.
    var description: String? { get set }

    /// false if not set
    /// Whether a permission-only project should be created.
    var permissions_only: Bool? { get set }

    /// false if not set
    /// Whether an empty initial commit should be created.
    var create_empty_commit: Bool? { get set }

    /// The submit type that should be set for the project (MERGE_IF_NECESSARY, REBASE_IF_NECESSARY, REBASE_ALWAYS, FAST_FORWARD_ONLY, MERGE_ALWAYS, CHERRY_PICK).
    /// If not set, MERGE_IF_NECESSARY is set as submit type unless repository.<name>.defaultSubmitType is set to a different value.
    var submit_type: String? { get set }

    /// A list of branches that should be initially created.
    /// For the branch names the refs/heads/ prefix can be omitted.
    var branches: [String]? { get set }

    /// A list of groups that should be assigned as project owner.
    /// Each group in the list must be specified as group-id.
    /// If not set, the groups that are configured as default owners are set as project owners.
    var owners: [String]? { get set }

    /// INHERIT if not set
    /// Whether contributor agreements should be used for the project (TRUE, FALSE, INHERIT).
    var use_contributor_agreements: String? { get set }

    /// INHERIT if not set
    /// Whether the usage of 'Signed-Off-By' footers is required for the project (TRUE, FALSE, INHERIT).
    var use_signed_off_by: String? { get set }

    /// INHERIT if not set
    /// Whether a new change is created for every commit not in target branch for the project (TRUE, FALSE, INHERIT).
    var create_new_change_for_all_not_in_target: String? { get set }

    /// INHERIT if not set
    /// Whether content merge should be enabled for the project (TRUE, FALSE, INHERIT).
    /// FALSE, if the submit_type is FAST_FORWARD_ONLY.
    var use_content_merge: String? { get set }

    /// INHERIT if not set
    /// Whether the usage of Change-Ids is required for the project (TRUE, FALSE, INHERIT).
    var require_change_id: String? { get set }

    /// Max allowed Git object size for this project. Common unit suffixes of 'k', 'm', or 'g' are supported.
    var max_object_size_limit: String? { get set }

    /// Plugin configuration values as map which maps the plugin name to a map of parameter names to values.
    var plugin_config_values: [[String: Any]]? { get set }
}

/// The ProjectParentInput entity contains information for setting a project parent.
public protocol ProjectParentInput: Codable {

    /// The name of the parent project.
    var parent: String { get set }

    /// Message that should be used to commit the change of the project parent in the project.config file to the refs/meta/config branch.
    var commit_message: String? { get set }
}

/// The ReflogEntryInfo entity describes an entry in a reflog.
public protocol ReflogEntryInfo: Codable {

    /// The old commit ID.
    var old_id: String { get set }

    /// The new commit ID.
    var new_id: String { get set }

    /// The user performing the change as a GitPersonInfo entity.
    var who: GitPersonInfo { get set }

    /// Comment of the reflog entry.
    var comment: String { get set }
}

/// The RepositoryStatisticsInfo entity contains information about statistics of a Git repository.
public protocol RepositoryStatisticsInfo: Codable {

    /// Number of loose objects.
    var number_of_loose_objects: UInt { get set }

    /// Number of loose refs.
    var number_of_loose_refs: UInt { get set }

    /// Number of pack files.
    var number_of_pack_files: UInt { get set }

    /// Number of packed objects.
    var number_of_packed_objects: UInt { get set }

    /// Number of packed refs.
    var number_of_packed_refs: UInt { get set }

    /// Size of loose objects in bytes.
    var size_of_loose_objects: UInt { get set }

    /// Size of packed objects in bytes.
    var size_of_packed_objects: UInt { get set }
}

/// The TagInfo entity contains information about a tag.
public protocol TagInfo: Codable {

    /// The ref of the tag.
    var ref: String { get set }

    /// TODO: Check Type
    /// For lightweight tags, the revision of the commit to which the tag points. For annotated tags, the revision of the tag object.
    var revision: String { get set }

    /// TODO: Check Type
    /// Only set for annotated tags.
    /// The revision of the object to which the tag points.
    var object: String? { get set }

    /// Only set for annotated tags.
    /// The tag message. For signed tags, includes the signature.
    var message: String? { get set }

    /// Only set for annotated tags, if present in the tag.
    /// The tagger as a GitPersonInfo entity.
    var tagger: GitPersonInfo { get set }

    /// false if not set
    /// Whether the calling user can delete this tag.
    var can_delete: Bool? { get set }

    /// Links to the tag in external sites as a list of WebLinkInfo entries.
    var web_links: [WebLinkInfo]? { get set }
}

/// The TagInput entity contains information for creating a tag.
public protocol TagInput: Codable {

    /// The name of the tag. The leading refs/tags/ is optional.
    var ref: String { get set }

    /// The revision to which the tag should point. If not specified, the project’s HEAD will be used.
    var revision: String? { get set }

    /// The tag message. When set, the tag will be created as an annotated tag.
    var message: String? { get set }
}

/// The ThemeInfo entity describes a theme.
public protocol ThemeInfo: Codable {

    /// The path to the GerritSite.css file.
    var css: String? { get set }

    /// The path to the GerritSiteHeader.html file.
    var header: String? { get set }

    /// The path to the GerritSiteFooter.html file.
    var footer: String? { get set }
}
