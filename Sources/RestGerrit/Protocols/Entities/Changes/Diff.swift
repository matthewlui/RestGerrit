//
//  Diff.swift
//  RestGerrit
//
//  Created by Matthew Lui on 18/2/2018.
//  Copyright © 2018 Chatboy.xyz. All rights reserved.
//

import Foundation

/// The DiffContent entity contains information about the content differences in a file.
public protocol DiffContent: Codable {

    /// Content only in the file on side A (deleted in B).
    var a: String? { get set }

    /// Content only in the file on side B (added in B).
    var b: String? { get set }

    /// Content in the file on both sides (unchanged).
    var ab: String? { get set }

    /// only present during a replace, i.e. both a and b are present
    /// Text sections deleted from side A as a DiffIntralineInfo entity.
    var edit_a: DiffIntralineInfo? { get set }

    /// only present during a replace, i.e. both a and b are present
    /// Text sections inserted in side B as a DiffIntralineInfo entity.
    var edit_b: DiffIntralineInfo? { get set }

    /// not set if false
    /// Indicates whether this entry was introduced by a rebase.
    var due_to_rebase: Bool? { get set }

    /// count of lines skipped on both sides when the file is too large to include all common lines.
    var skip: UInt? { get set }

    /// Set to true if the region is common according to the requested
    /// ignore-whitespace parameter, but a and b contain differing amounts
    /// of whitespace. When present and true a and b are used instead of ab.
    var common: Bool? { get set }
}

/// The DiffFileMetaInfo entity contains meta information about a file diff.
public protocol DiffFileMetaInfo: Codable {

    /// The name of the file.
    var name: String { get set }

    /// The content type of the file.
    var content_type: String { get set }

    /// The total number of lines in the file.
    var lines: UInt { get set }

    /// Links to the file in external sites as a list of WebLinkInfo entries.
    var web_linls: String? { get set }
}

// TODO: Check type
public protocol DiffIntralineInfo: Codable {

}

/// The DiffInfo entity contains information about the diff of a file in a revision.
/// If the weblinks-only parameter is specified, only the web_links field is set.
public protocol DiffInfo: Codable {

    /// not present when the file is added
    /// Meta information about the file on side A as a DiffFileMetaInfo entity.
    var meta_a: String? { get set }

    /// Meta information about the file on side B as a DiffFileMetaInfo entity.
    var meta_b: String? { get set }

    /// The type of change (ADDED, MODIFIED, DELETED, RENAMED COPIED, REWRITE).
    var change_type: String { get set }

    /// only set when the intraline parameter was specified in the request
    /// Intraline status (OK, ERROR, TIMEOUT).
    var intraline_status: String { get set }

    /// A list of strings representing the patch set diff header.
    var diff_header: [String] { get set }

    /// The content differences in the file as a list of DiffContent entities.
    var content: [DiffContent] { get set }

    /// Links to the file diff in external sites as a list of DiffWebLinkInfo entries.
    var web_links: String? { get set }

    /// not set if false
    /// Whether the file is binary.
    var binary: Bool? { get set }
}

// TODO: Check api return
/// The DiffIntralineInfo entity contains information about intraline edits in a file.
///
/// The information consists of a list of <skip length, mark length> pairs, where the
/// skip length is the number of characters between the end of the previous edit and
/// the start of this edit, and the mark length is the number of edited characters
/// following the skip. The start of the edits is from the beginning of the related diff content lines.
///
/// Note that the implied newline character at the end of each line is included in
/// the length calculation, and thus it is possible for the edits to span newlines.
public protocol DiffIntraLineInfo: Codable {

}

/// The DiffWebLinkInfo entity describes a link on a diff screen to an external site.
public protocol DiffWebLinkInfo: Codable {

    /// The link name.
    var name: String { get set }

    /// The link URL.
    var url: String { get set }

    /// URL to the icon of the link.
    var image_url: String { get set }

    /// Whether the web link should be shown on the side-by-side diff screen.
    var show_on_side_by_side_diff_view: Bool { get set }

    /// Whether the web link should be shown on the unified diff screen.
    var show_on_unified_diff_view: Bool { get set }
}
