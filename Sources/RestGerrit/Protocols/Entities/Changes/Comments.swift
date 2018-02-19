//
//  Comments.swift
//  RestGerrit
//
//  Created by Matthew Lui on 18/2/2018.
//  Copyright © 2018 Chatboy.xyz. All rights reserved.
//

import Foundation

/// The CommentInfo entity contains information about an inline comment.
public protocol CommentInfo: Codable {

    /// The patch set number for the comment; only set in contexts where
    /// comments may be returned for multiple patch sets.
    var patch_set: String? { get set }

    /// The URL encoded UUID of the comment.
    var id: String { get set }

    /// The path of the file for which the inline comment was done.
    /// Not set if returned in a map where the key is the file path.
    var path: String? { get set }

    /// The side on which the comment was added.
    /// Allowed values are REVISION and PARENT.
    /// If not set, the default is REVISION.
    var side: String? { get set }

    /// The 1-based parent number. Used only for merge commits when
    /// side == PARENT. When not set the comment is for the auto-merge tree.
    var parent: String? { get set }

    /// The number of the line for which the comment was done.
    /// If range is set, this equals the end line of the range.
    /// If neither line nor range is set, it’s a file comment.
    var line: String? { get set }

    /// The range of the comment as a CommentRange entity.
    var range: CommentRange? { get set }

    /// The URL encoded UUID of the comment to which this comment is a reply.
    var in_reply_to: String? { get set }

    /// The comment message.
    var message: String? { get set }

    /// The timestamp of when this comment was written.
    var updated: Date { get set }
    /// The author of the message as an AccountInfo entity.
    /// Unset for draft comments, assumed to be the calling user.
    var author: AccountInfo? { get set }

    /// Value of the tag field from ReviewInput set while posting the review.
    /// NOTE: To apply different tags on on different votes/comments multiple
    /// invocations of the REST call are required.
    var tag: String? { get set }

    /// Whether or not the comment must be addressed by the user.
    /// The state of resolution of a comment thread is stored in
    /// the last comment in that thread chronologically.
    var unresolved: String? { get set }
}

/// The CommentInput entity contains information for creating an inline comment.
public protocol CommentInput: Codable {
    /// The URL encoded UUID of the comment if an existing draft comment should be updated.
    var id: String? { get set }

    /// The path of the file for which the inline comment should be added.
    /// Doesn’t need to be set if contained in a map where the key is the file path.
    var path: String? { get set }

    /// The side on which the comment should be added.
    /// Allowed values are REVISION and PARENT.
    /// If not set, the default is REVISION.
    var side: String? { get set }

    /// The number of the line for which the comment should be added.
    /// 0 if it is a file comment.
    /// If neither line nor range is set, a file comment is added.
    /// If range is set, this value is ignored in favor of the end_line of the range.
    var line: Int? { get set }

    /// The range of the comment as a CommentRange entity.
    var range: CommentRange? { get set }

    /// The URL encoded UUID of the comment to which this comment is a reply.
    var in_reply_to: String? { get set }
    /// The timestamp of this comment.
    /// Accepted but ignored.
    var updated: Date? { get set }

    /// The comment message.
    /// If not set and an existing draft comment is updated, the existing draft comment is deleted.
    var message: String? { get set }
    /// drafts only
    /// Value of the tag field. Only allowed on draft comment
    /// inputs; for published comments, use the tag field in
    /// link#review-input[ReviewInput]
    var tag: String? { get set }

    /// Whether or not the comment must be addressed by the user.
    /// This value will default to false if the comment is an orphan,
    /// or the value of the in_reply_to comment if it is supplied.
    var unresolved: Bool? { get set }

}

/// The CommentRange entity describes the range of an inline comment.
public protocol CommentRange: Codable {

    /// The start line number of the range. (1-based, inclusive)
    var start_line: UInt { get set }

    /// The character position in the start line. (0-based, inclusive)
    var start_character: UInt { get set }

    /// The end line number of the range. (1-based, exclusive)
    var end_line: UInt { get set }

    /// The character position in the end line. (0-based, exclusive)
    var end_character: UInt { get set }
}

/// The DeleteCommentInput entity contains the option for deleting a comment.
public protocol DeleteCommentInput: Codable {

    /// The reason why the comment should be deleted.
    /// If set, the comment’s message will be replaced with
    /// "Comment removed by: name; Reason: reason`",
    /// or just "Comment removed by: `name." if not set.
    var reason: String? { get set }
}

/// The RobotCommentInfo entity contains information about a robot inline comment.
/// RobotCommentInfo has the same fields as CommentInfo. In addition RobotCommentInfo has the following fields:
public protocol RobotCommentInfo: CommentInfo {

    /// The ID of the robot that generated this comment.
    var robot_id: String { get set }

    /// An ID of the run of the robot.
    var robot_run_id: String { get set }

    /// URL to more information.
    var url: String? { get set }

    /// Robot specific properties as map that maps arbitrary keys to values.
    var properties: [String: String]? { get set }

    /// Suggested fixes for this robot comment as a list of FixSuggestionInfo entities.
    var fix_suggestion: FixSuggestionInfo? { get set }
}

/// The RobotCommentInput entity contains information for creating an inline robot comment.
public typealias RobotCommentInput = RobotCommentInfo
