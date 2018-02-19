//
//  Commit.swift
//  RestGerrit
//
//  Created by Matthew Lui on 18/2/2018.
//  Copyright © 2018 Chatboy.xyz. All rights reserved.
//

import Foundation

/// The CommitInfo entity contains information about a commit.
public protocol CommitInfo: Codable {

    /// The commit ID. Not set if included in a RevisionInfo entity that is
    /// contained in a map which has the commit ID as key.
    var commit: String? { get set }

    /// The parent commits of this commit as a list of CommitInfo entities.
    /// In each parent only the commit and subject fields are populated.
    var parents: [CommitInfo] { get set }

    /// The author of the commit as a GitPersonInfo entity.
    var author: GitPersonInfo { get set }

    /// The committer of the commit as a GitPersonInfo entity.
    var committer: GitPersonInfo { get set }

    /// The subject of the commit (header line of the commit message).
    var subject: String { get set }

    /// The commit message.
    var message: String { get set }

    /// Links to the commit in external sites as a list of WebLinkInfo entities.
    var web_links: String? { get set }

}

/// The CommitMessageInput entity contains information for changing the commit message of a change.
public protocol CommitMessageInput: Codable {

    /// New commit message.
    var message: String { get set }

    /// Notify handling that defines to whom email notifications should be sent
    /// after the commit message was updated.
    /// Allowed values are NONE, OWNER, OWNER_REVIEWERS and ALL.
    /// If not set, the default is OWNER for WIP changes and ALL otherwise.
    var notify: String? { get set }

    /// Additional information about whom to notify about the update as a map of recipient type to NotifyInfo entity.
    var notify_details: String? { get set }

}

/// The FileInfo entity contains information about a file in a patch set.
public protocol FileInfo: Codable {

    /// The status of the file (“A”=Added, “D”=Deleted, “R”=Renamed, “C”=Copied, “W”=Rewritten).
    /// Not set if the file was Modified (“M”).
    var status: String? { get set }

    /// Whether the file is binary.
    var binary: Bool? { get set }

    /// The old file path.
    /// Only set if the file was renamed or copied.
    var old_path: String? { get set }

    /// Number of inserted lines.
    /// Not set for binary files or if no lines were inserted.
    var lines_inserted: UInt? { get set }

    /// Number of deleted lines.
    /// Not set for binary files or if no lines were deleted.
    var lines_deleted: UInt? { get set }

    /// Number of bytes by which the file size increased/decreased.
    var size_delta: UInt { get set }

    /// File size in bytes.
    var size: UInt { get set }

}
