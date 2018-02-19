//
//  Changes.swift
//  RestGerrit
//
//  Created by Matthew Lui on 18/2/2018.
//  Copyright © 2018 Chatboy.xyz. All rights reserved.
//

import Foundation

public typealias AccountId = String

public typealias NumericId = Int

/// The ChangeInfo entity contains information about a change.
public protocol ChangeInfo: Codable {

    /// The ID of the change in the format "'<project>~<branch>~<Change-Id>'",
    /// where 'project', 'branch' and 'Change-Id' are URL encoded. For 'branch'
    /// the refs/heads/ prefix is omitted.
    var id: String { get set }

    /// The name of the project.
    var project: String { get set }

    /// The name of the target branch.
    /// The refs/heads/ prefix is omitted.
    var branch: String { get set }

    /// The topic to which this change belongs.
    var topic: String? { get set }

    /// The assignee of the change as an AccountInfo entity.
    var assignee: AccountInfo? { get set }

    /// List of hashtags that are set on the change (only populated when NoteDb is enabled).
    var hashtags: [String]? { get set }

    /// The Change-Id of the change.
    var change_id: String { get set }

    /// The subject of the change (header line of the commit message).
    var subject: String { get set }

    /// The status of the change (NEW, MERGED, ABANDONED).
    var status: String { get set }

    /// The timestamp of when the change was created.
    var created: Date { get set }

    /// The timestamp of when the change was last updated.
    var updated: Date { get set }

    /// only set for merged changes, The timestamp of when the change was submitted.
    var submitted: Date { get set }

    /// only set for merged changes
    /// The user who submitted the change, as an AccountInfo entity.
    var submitter: AccountInfo { get set }

    /// not set if false
    /// Whether the calling user has starred this change with the default label.
    var starred: Bool { get set }

    /// A list of star labels that are applied by the calling user to this change.
    /// The labels are lexicographically sorted.
    var stars: [String]? { get set }

    /// not set if false
    /// Whether the change was reviewed by the calling user. Only set if reviewed is requested.
    var reviewed: Bool { get set }

    /// The submit type of the change.
    /// Not set for merged changes.
    var submit_type: String? { get set }

    /// Whether the change is mergeable.
    /// Not set for merged changes, or if the change has not yet been tested.
    var mergeable: Bool? { get set }

    /// Whether the change has been approved by the project submit rules.
    /// Only set if requested.
    var submittable: Bool? { get set }

    /// Number of inserted lines.
    var insertions: Int { get set }
    /// Number of deleted lines.
    var deletions: Int { get set }
    /// Number of unresolved comments. Not set if the current change index doesn’t have the data.
    var unresolved_comment_count: Int? { get set }

    /// The legacy numeric ID of the change.
    var _number: Int { get set }

    ///The owner of the change as an AccountInfo entity.
    var owner: AccountInfo { get set }

    /// Actions the caller might be able to perform on this revision.
    /// The information is a map of view name to ActionInfo entities.
    var actions: ActionInfo? { get set }

    /// The labels of the change as a map that maps the label names to LabelInfo entries.
    /// Only set if labels or detailed labels are requested.
    var labels: [String]? { get set }

    /// A map of the permitted labels that maps a label name to the list of values that are
    /// allowed for that label. Only set if detailed labels are requested.
    var permitted_labels: [String]? { get set }

    /// The reviewers that can be removed by the calling user as a list of AccountInfo entities.
    /// Only set if detailed labels are requested.
    var removable_reviewers: [AccountInfo]? { get set }

    /// The reviewers as a map that maps a reviewer state to a list of AccountInfo entities.
    /// Possible reviewer states are REVIEWER, CC and REMOVED.
    /// REVIEWER: Users with at least one non-zero vote on the change.
    /// CC: Users that were added to the change, but have not voted.
    /// REMOVED: Users that were previously reviewers on the change, but have been removed.
    /// Only set if detailed labels are requested.
    var reviewers: [AccountInfo]? { get set }

    /// Updates to reviewers that have been made while the change was in the WIP state.
    /// Only present on WIP changes and only if there are pending reviewer updates to report.
    /// These are reviewers who have not yet been notified about being added to or removed from the change.
    /// Only set if detailed labels are requested.
    var pending_reviewers: [AccountInfo]? { get set }

    /// Updates to reviewers set for the change as ReviewerUpdateInfo entities.
    /// Only set if reviewer updates are requested and if NoteDb is enabled.
    var reviewer_updates: [ReviewerUpdateInfo]? { get set }

    /// Messages associated with the change as a list of ChangeMessageInfo entities.
    /// Only set if messages are requested.
    var messages: [ChangeMessageInfo]? { get set }

    /// The commit ID of the current patch set of this change.
    /// Only set if the current revision is requested or if all revisions are requested.
    var current_revision: String { get set }

    /// All patch sets of this change as a map that maps the commit ID of the patch set to
    /// a RevisionInfo entity.
    /// Only set if the current revision is requested (in which case it will only contain a
    /// key for the current revision) or if all revisions are requested.
    var revisions: [RevisionInfo]? { get set }

    /// A list of TrackingIdInfo entities describing references to external tracking systems.
    /// Only set if tracking ids are requested.
    var tracking_ids: [TrackingIdInfo] { get set }

    /// optional, not set if false
    /// Whether the query would deliver more results if not limited.
    /// Only set on the last change that is returned.
    var _more_changes: Bool? { get set }

    /// A list of ProblemInfo entities describing potential problems with this change. Only set if CHECK is set.
    var problems: [ProblemInfo]? { get set }

    /// optional, not set if false
    /// When present, change is marked as private.
    var is_private: Bool? { get set }

    /// Not set if false.
    /// When present, change is marked as Work In Progress.
    var work_in_progress: Bool? { get set }

    /// Not set if false
    /// When present, change has been marked Ready at some point in time.
    var has_review_started: Bool? { get set }

    /// The numeric Change-Id of the change that this change reverts.
    var revert_of: String? { get set }

}

/// The ChangeInput entity contains information about creating a new change.
public protocol ChangeInput: Codable {

    /// The name of the project.
    var project: String { get set }

    /// The name of the target branch.
    /// The refs/heads/ prefix is omitted.
    var branch: String { get set }

    /// The subject of the change (header line of the commit message).
    var subject: String { get set }

    /// The topic to which this change belongs.
    var topic: String? { get set }

    /// The status of the change (only NEW accepted here).
    var status: String? { get set }

    /// Whether the new change should be marked as private.
    var is_private: String? { get set }

    /// Whether the new change should be set to work in progress.
    var work_in_progress: String? { get set }

    /// A {change-id} that identifies the base change for a create change operation.
    var base_change: String? { get set }

    /// Allow creating a new branch when set to true.
    var new_branch: String? { get set }

    /// The detail of a merge commit as a MergeInput entity.
    var merge: MergeInput? { get set }

    /// Notify handling that defines to whom email notifications
    /// should be sent after the change is created.
    /// Allowed values are NONE, OWNER, OWNER_REVIEWERS and ALL.
    /// If not set, the default is ALL.
    var notify: String? { get set }

    /// Additional information about whom to notify about the change
    /// creation as a map of recipient type to NotifyInfo entity.
    var notify_details: String? { get set }

}

/// The ChangeMessageInfo entity contains information about a message attached to a change.
public protocol ChangeMessageInfo: Codable {

    /// The ID of the message.
    var id: String { get set }

    /// Author of the message as an AccountInfo entity.
    /// Unset if written by the Gerrit system.
    var author: AccountInfo? { get set }

    /// Real author of the message as an AccountInfo entity.
    /// Set if the message was posted on behalf of another user.
    var real_author: AccountInfo? { get set }

    /// The timestamp this message was posted.
    var date: String { get set }

    ///The text left by the user.
    var message: String { get set }

    /// Value of the tag field from ReviewInput set while posting the review.
    /// NOTE: To apply different tags on on different votes/comments multiple
    /// invocations of the REST call are required.
    var tag: String? { get set }

    /// Which patchset (if any) generated this message.
    var _revision_number: String? { get set }

}

/// The RelatedChangesInfo entity contains information about related changes.
public protocol RelatedChangesInfo: Codable {

    /// A list of RelatedChangeAndCommitInfo entities describing the related changes.
    /// Sortesd by git commit order, newest to oldest. Empty if there are no related changes.
    var changes: [RelatedChangeAndCommitInfo] { get set }
}

/// The RevisionInfo entity contains information about a patch set. Not all fields are returned by default. Additional fields can be obtained by adding o parameters as described in Query Changes.
public protocol RevisionInfo: Codable {

    /// The change kind. Valid values are REWORK, TRIVIAL_REBASE, MERGE_FIRST_PARENT_UPDATE, NO_CODE_CHANGE, and NO_CHANGE.
    var kind: String { get set }

    /// The patch set number.
    var _number: UInt { get set }

    /// The timestamp of when the patch set was created.
    var created: Date { get set }

    /// The uploader of the patch set as an AccountInfo entity.
    var uploader: AccountInfo { get set }

    /// The Git reference for the patch set.
    var ref: String { get set }

    /// Information about how to fetch this patch set. The fetch information is provided as a map that maps the protocol name (“git”, “http”, “ssh”) to FetchInfo entities. This information is only included if a plugin implementing the download commands interface is installed.
    var fetch: String { get set }

    /// The commit of the patch set as CommitInfo entity.
    var commit: CommitInfo? { get set }

    /// The files of the patch set as a map that maps the file names to FileInfo entities. Only set if CURRENT_FILES or ALL_FILES option is requested.
    var files: FetchInfo? { get set }

    /// Actions the caller might be able to perform on this revision. The information is a map of view name to ActionInfo entities.
    var actions: [ActionInfo]? { get set }

    /// Indicates whether the caller is authenticated and has commented on the current revision. Only set if REVIEWED option is requested.
    var reviewed: Bool? { get set }

    /// If the COMMIT_FOOTERS option is requested and this is the current patch set, contains the full commit message with Gerrit-specific commit footers, as if this revision were submitted using the Cherry Pick submit type.
    var messageWithFooter: String? { get set }

    /// If the PUSH_CERTIFICATES option is requested, contains the push certificate provided by the user when uploading this patch set as a PushCertificateInfo entity. This field is always set if the option is requested; if no push certificate was provided, it is set to an empty object.
    var push_certificate: String? { get set }

    /// The description of this patchset, as displayed in the patchset selector menu. May be null if no description is set.
    var description: String? { get set }
}

/// The EditInfo entity contains information about a change edit.
public protocol EditInfo: Codable {

    /// The commit of change edit as CommitInfo entity.
    var commit: CommitInfo { get set }

    /// The revision of the patch set the change edit is based on.
    var base_revision: String { get set }

    /// Information about how to fetch this patch set. The fetch information
    /// is provided as a map that maps the protocol name (“git”, “http”, “ssh”)
    /// to FetchInfo entities.
    var fetch: FetchInfo? { get set }

    /// The files of the change edit as a map that maps the file names to FileInfo entities.
    var files: FileInfo? { get set }
}

/// The ApprovalInfo entity contains information about an approval from a user for a label on a change.
///
/// ApprovalInfo has the same fields as AccountInfo. In addition ApprovalInfo has the following fields:
public protocol ApprovalInfo: Codable {

    /// The vote that the user has given for the label. If present and zero, the user is permitted to vote on the label. If absent, the user is not permitted to vote on that label.
    var value: Int? { get set }

    /// The VotingRangeInfo the user is authorized to vote on that label. If present, the user is permitted to vote on the label regarding the range values. If absent, the user is not permitted to vote on that label.
    var permitted_voting_range: VotingRangeInfo? { get set }

    /// The time and date describing when the approval was made.
    var date: Date? { get set }

    /// Value of the tag field from ReviewInput set while posting the review. NOTE: To apply different tags on on different votes/comments multiple invocations of the REST call are required.
    var tag: String? { get set }

    /// not set if false
    /// If true, this vote was made after the change was submitted.
    var post_submit: Bool? { get set }
}

/// The DeleteVoteInput entity contains options for the deletion of a vote.
public protocol DeleteVoteInput: Codable {

    /// The label for which the vote should be deleted.
    /// If set, must match the label in the URL.
    var label: String? { get set }

    /// Notify handling that defines to whom email notifications should be sent after the vote is deleted.
    /// Allowed values are NONE, OWNER, OWNER_REVIEWERS and ALL.
    /// If not set, the default is ALL.
    var notify: String? { get set }

    /// Additional information about whom to notify about the update as a map of recipient type to NotifyInfo entity.
    var notify_details: String? { get set }
}

/// The DescriptionInput entity contains information for setting a description.
public protocol DescriptionInput: Codable {

    /// The description text.
    var description: String { get set }
}

/// The EditFileInfo entity contains additional information of a file within a change edit.
public protocol EditFileInfo: Codable {

    /// Links to the diff info in external sites as a list of WebLinkInfo entities.
    var web_links: [WebLinkInfo]? { get set }
}


/// The FixInput entity contains options for fixing commits using the fix change endpoint.
public protocol FixInput: Codable {
    /// If true, delete patch sets from the database if they refer to missing commit options.
    var delete_patch_set_if_commit_missing: Bool { get set }

    /// If set, check that the change is merged into the destination branch as this exact SHA-1.
    /// If not, insert a new patch set referring to this commit.
    var expect_merged_as: Bool { get set }
}

/// The FixSuggestionInfo entity represents a suggested fix.
public protocol FixSuggestionInfo: Codable {

    /// generated, don’t set
    /// The UUID of the suggested fix. It will be generated automatically and hence
    /// will be ignored if it’s set for input objects.
    var fix_id: String { get set }

    /// A description of the suggested fix.
    var description: String { get set }

    /// A list of FixReplacementInfo entities indicating how the content of one or
    /// several files should be modified. Within a file, they should refer to non-overlapping regions.
    var replacements: [FixReplacementInfo] { get set }
}

/// The FixReplacementInfo entity describes how the content of a file should be replaced by another content.
public protocol FixReplacementInfo: Codable {

    //The path of the file which should be modified. Any file in the repository may be modified.
    var path: String { get set }

    /// A CommentRange indicating which content of the file should be replaced. Lines in the file
    /// are assumed to be separated by the line feed character, the carriage return character,
    /// the carriage return followed by the line feed character, or one of the other Unicode
    /// linebreak sequences supported by Java.
    var range: CommentRange { get set }

    /// The content which should be used instead of the current one.
    var replacement: String { get set }
}

/// The HashtagsInput entity contains information about hashtags to add to, and/or remove from, a change.
public protocol HashtagsInput: Codable {

    /// The list of hashtags to be added to the change.
    var add: [String]? { get set }

    /// The list of hashtags to be removed from the change.
    var remove: [String]? { get set }
}

/// The IncludedInInfo entity contains information about the branches a change was merged into and tags it was tagged with.
public protocol IncludedInInfo: Codable {

    /// The list of branches this change was merged into. Each branch is listed without the 'refs/head/' prefix.
    var branched: [String] { get set }
    /// The list of tags this change was tagged with. Each tag is listed without the 'refs/tags/' prefix.
    var tags: [String] { get set }

    /// A map that maps a name to a list of external systems that include this change, e.g.
    /// a list of servers on which this change is deployed.
    var external: [String: String]? { get set }
}

/// The MoveInput entity contains information for moving a change to a new branch.
public protocol MoveInput: Codable {

    /// Destination branch
    var destination_branch: String { get set }

    /// A message to be posted in this change’s comments
    var message: String? { get set }
}

/// The PrivateInput entity contains information for changing the private flag on a change.
public protocol PrivateInput: Codable {

    /// Message describing why the private flag was changed.
    var message: String? { get set }
}

/// The PublishChangeEditInput entity contains options for the publishing of change edit.
public protocol PublishChangeEditInput: Codable {

    /// Notify handling that defines to whom email notifications should be sent after the change edit is published.
    /// Allowed values are NONE and ALL.
    /// If not set, the default is ALL
    var notify: String? { get set }

    // TODO: Check Type
    /// Additional information about whom to notify about the update as a map
    /// of recipient type to NotifyInfo entity.
    var notofy_details: NotifyInfo { get set }
}

/// The RebaseInput entity contains information for changing parent when rebasing.
public protocol RebaseInput: Codable {

    /// The new parent revision. This can be a ref or a SHA1 to a concrete patchset.
    /// Alternatively, a change number can be specified, in which case the current patch set is inferred.
    /// Empty string is used for rebasing directly on top of the target branch,
    /// which effectively breaks dependency towards a parent change.
    var base: String? { get set }
}

/// The RelatedChangeAndCommitInfo entity contains information about a related change and commit.
public protocol RelatedChangeAndCommitInfo: Codable {

    /// The project of the change or commit.
    var project: String { get set }

    /// The Change-Id of the change.
    var change_id: String? { get set }

    /// The commit as a CommitInfo entity.
    var commit: CommitInfo { get set }

    /// The change number.
    var _change_number: String? { get set }

    /// The revision number.
    var _revision_number: String? { get set }

    /// The current revision number.
    var _current_revision_number: String? { get set }

    /// The status of the change. The status of the change is one of (NEW, MERGED, ABANDONED).
    var status: String? { get set }
}

/// The RestoreInput entity contains information for restoring a change.
public protocol RestoreInput: Codable {

    /// Message to be added as review comment to the change when restoring the change.
    var message: String? { get set }
}

/// The RevertInput entity contains information for reverting a change.
public protocol RevertInput: Codable {

    /// Message to be added as review comment to the change when reverting the change.
    var message: String? { get set }

}
