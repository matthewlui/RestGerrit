//
//  Review.swift
//  RestGerrit
//
//  Created by Matthew Lui on 18/2/2018.
//  Copyright © 2018 Chatboy.xyz. All rights reserved.
//

import Foundation

/// The ReviewInfo entity contains information about a review.
public protocol ReviewInfo: Codable {

    /// TODO: Check "value" type
    /// The labels of the review as a map that maps the label names to the voting values.
    var labels: [String: Any] { get set }
}

/// The DeleteReviewerInput entity contains options for the deletion of a reviewer.
public protocol DeleteReviewerInput: Codable {

    /// Notify handling that defines to whom email notifications should be sent after the reviewer is deleted.
    /// Allowed values are NONE, OWNER, OWNER_REVIEWERS and ALL.
    /// If not set, the default is ALL.
    var notify: String? { get set }

    /// Additional information about whom to notify about the update as a map of recipient type to NotifyInfo entity.
    var notify_details: String? { get set }
}

/// The ReviewerUpdateInfo entity contains information about updates to change’s reviewers set.
public protocol ReviewerUpdateInfo: Codable {

    /// Timestamp of the update.
    var updated: Date { get set }
    /// The account which modified state of the reviewer in question as AccountInfo entity.
    var updated_by: AccountInfo { get set }
    /// The reviewer account added or removed from the change as an AccountInfo entity.
    var reviewer: AccountInfo { get set }
    /// The reviewer state, one of REVIEWER, CC or REMOVED
    var state: String { get set }
}

/// The ReviewInput entity contains information for adding a review to a revision.
public protocol ReviewInput: Codable {
    /// Apply this tag to the review comment message, votes, and inline comments.
    /// Tags may be used by CI or other automated systems to distinguish them from
    /// human reviews. Comments with specific tag values can be filtered out in the web UI.
    var tag: String? { get set }

    /// The votes that should be added to the revision as a map that maps the label
    /// names to the voting values.
    var labels: [String]? { get set }

    /// The comments that should be added as a map that maps a file path to a list of CommentInput entities.
    var comments: [CommentInput]? { get set }

    /// The robot comments that should be added as a map that maps a file path to a list of RobotCommentInput entities.
    var robot_comments: [RobotCommentInput]? { get set }

    /// true if not set
    /// Whether all labels are required to be within the user’s permitted ranges based on access controls.
    /// If true, attempting to use a label not granted to the user will fail the entire modify operation early.
    /// If false, the operation will execute anyway, but the proposed labels will be modified to be the "best" value allowed by the access controls.
    var strict_labels: Bool? { get set }

    /// Draft handling that defines how draft comments are handled that are already in the database but that were not also described in this input.
    /// Allowed values are DELETE, PUBLISH, PUBLISH_ALL_REVISIONS and KEEP. All values except PUBLISH_ALL_REVISIONS operate only on drafts for a single revision.
    /// Only KEEP is allowed when used in conjunction with on_behalf_of.
    /// If not set, the default is DELETE, unless on_behalf_of is set, in which case the default is KEEP and any other value is disallowed.
    var drafts: String? { get set }

    /// Notify handling that defines to whom email notifications should be sent after the review is stored.
    /// Allowed values are NONE, OWNER, OWNER_REVIEWERS and ALL.
    /// If not set, the default is ALL.
    var notify: String? { get set }

    /// Additional information about whom to notify about the update as a map of recipient type to NotifyInfo entity.
    var notify_details: [NotifyInfo]? { get set }

    /// If true, comments with the same content at the same place will be omitted.
    var omit_duplicate_comments: Bool? { get set }

    /// {account-id} the review should be posted on behalf of. To use this option the caller must have been granted labelAs-NAME permission for all keys of labels.
    var on_behalf_of: AccountId? { get set }

    /// A list of ReviewerInput representing reviewers that should be added to the change.
    var reviewers: [DeleteReviewerInput]? { get set }

    /// If true, and if the change is work in progress, then start review. It is an error for both ready and work_in_progress to be true.
    var ready: Bool? { get set }

    /// If true, mark the change as work in progress. It is an error for both ready and work_in_progress to be true.
    var work_in_progress: Bool? { get set }

}

/// The ReviewerInput entity contains information for adding a reviewer to a change.
public protocol ReviewerInput: Codable {

    /// The ID of one account that should be added as reviewer or the ID of one group for which all members should be added as reviewers.
    /// If an ID identifies both an account and a group, only the account is added as reviewer to the change.
    var reviewer: AccountId { get set }

    /// Add reviewer in this state. Possible reviewer states are REVIEWER and CC. If not given, defaults to REVIEWER.
    var state: String? { get set }

    /// Whether adding the reviewer is confirmed.
    /// The Gerrit server may be configured to require a confirmation when adding a group as reviewer that has many members.
    var confirmed: Bool? { get set }

    /// Notify handling that defines to whom email notifications should be sent after the reviewer is added.
    /// Allowed values are NONE, OWNER, OWNER_REVIEWERS and ALL.
    /// If not set, the default is ALL.
    var notify: String? { get set }

    // TODO: Check Type
    /// Additional information about whom to notify about the update as a map of recipient type to NotifyInfo entity.
    var notify_details: NotifyInfo? { get set }

}
