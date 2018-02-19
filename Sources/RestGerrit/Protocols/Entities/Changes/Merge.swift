//
//  Merge.swift
//  RestGerrit
//
//  Created by Matthew Lui on 18/2/2018.
//  Copyright © 2018 Chatboy.xyz. All rights reserved.
//

import Foundation

/// The MergeableInfo entity contains information about the mergeability of a change.
public protocol MergeableInfo: Codable {

    /// Submit type used for this change, can be MERGE_IF_NECESSARY,
    /// FAST_FORWARD_ONLY, REBASE_IF_NECESSARY, REBASE_ALWAYS, MERGE_ALWAYS or CHERRY_PICK.
    var submit_type: String { get set }

    /// The strategy of the merge, can be recursive, resolve, simple-two-way-in-core, ours or theirs
    var strategy: String? { get set }

    /// true if this change is cleanly mergeable, false otherwise
    var mergeable: Bool { get set }

    /// true if this change is already merged, false otherwise
    var commit_merged: Bool? { get set }

    /// true if the content of this change is already merged, false otherwise
    var content_merged: Bool? { get set }

    /// A list of paths with conflicts
    var conflicts: [String]? { get set }

    /// A list of other branch names where this change could merge cleanly
    var mergeable_into: [String]? { get set }
}

/// The MergeInput entity contains information about the merge
public protocol MergeInput: Codable {
    /// The source to merge from, e.g. a complete or abbreviated commit SHA-1,
    /// a complete reference name, a short reference name under refs/heads,
    /// refs/tags, or refs/remotes namespace, etc.
    var source: String { get set }

    /// The strategy of the merge, can be recursive, resolve, simple-two-way-in-core,
    /// ours or theirs, default will use project settings.
    var strategy: String? { get set }
}

/// The MergePatchSetInput entity contains information about updating a new change by
/// creating a new merge commit.
public protocol MergePatchSetInput: Codable {

    /// The new subject for the change, if not specified, will reuse the current patch set’s subject
    var subject: String? { get set }

    /// Use the current patch set’s first parent as the merge tip when set to true. Otherwise,
    /// use the current branch tip of the destination branch.
    var inheritParent: String? { get set }

    /// The detail of the source commit for merge as a MergeInput entity.
    var merge: MergeInput { get set }
}
