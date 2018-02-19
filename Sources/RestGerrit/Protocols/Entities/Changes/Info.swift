//
//  Info.swift
//  RestGerrit
//
//  Created by Matthew Lui on 18/2/2018.
//  Copyright © 2018 Chatboy.xyz. All rights reserved.
//

import Foundation

/// The TrackingIdInfo entity describes a reference to an external tracking system.
public protocol TrackingIdInfo: Codable {

    /// The name of the external tracking system.
    var system: String { get set }

    /// The tracking id.
    var id: String { get set }
}

/// The VotingRangeInfo entity describes the continuous voting range from min to max values.
public protocol VotingRangeInfo: Codable {

    /// The minimum voting value.
    var min: Int { get set }
    /// The maximum voting value.
    var max: Int { get set }
}

/// The WebLinkInfo entity describes a link to an external site.
public protocol WebLinkInfo: Codable {

    /// The link name.
    var name: String { get set }

    /// The link URL.
    var url: String { get set }

    /// URL to the icon of the link.
    var image_url: String { get set }
}

/// The GitPersonInfo entity contains information about the author/committer of a commit.
public protocol GitPersonInfo: Codable {

    /// The name of the author/committer.
    var name: String { get set }

    /// The email address of the author/committer.
    var email: String { get set }

    /// The timestamp of when this identity was constructed.
    var date: Date { get set }

    /// The timezone offset from UTC of when this identity was constructed.
    var tz: String { get set }
}

/// The GroupBaseInfo entity contains base information about the group.
public protocol GroupBaseInfo: Codable {

    /// The UUID of the group.
    var id: String { get set }

    /// The name of the group.
    var name: String { get set }
}


// TODO: Check API
/// The LabelInfo entity contains information about a label on a change, always corresponding to the current patch set.
/// There are two options that control the contents of LabelInfo: LABELS and DETAILED_LABELS.
/// For a quick summary of the state of labels, use LABELS.
/// For detailed information about labels, including exact numeric votes
/// for all users and the allowed range of votes for the current user, use DETAILED_LABELS.
public protocol LabelInfo {

    /// not set if false
    /// Whether the label is optional. Optional means the label may be set,
    /// but it’s neither necessary for submission nor does it block submission if set.
    var optional: Bool? { get set }
}

public protocol LABELS {

    /// One user who approved this label on the change (voted the maximum value) as an AccountInfo entity.
    var approved: AccountInfo? { get set }

    /// One user who rejected this label on the change (voted the minimum value) as an AccountInfo entity.
    var rejected: AccountInfo? { get set }

    /// One user who recommended this label on the change (voted positively, but not the maximum value) as an AccountInfo entity.
    var recommended: AccountInfo? { get set }

    /// One user who disliked this label on the change (voted negatively, but not the minimum value) as an AccountInfo entity.
    var disliked: AccountInfo? { get set }

    /// If true, the label blocks submit operation. If not set, the default is false.
    var blocking: Bool? { get set }

    // TODO: Check type
    /// The voting value of the user who recommended/disliked this label on the change if it is not “+1”/“-1”.
    var value: String { get set }

    /// The default voting value for the label. This value may be outside the range specified in permitted_labels.
    var default_value: String { get set }
}

public protocol DETAILED_LABELS {

    /// List of all approvals for this label as a list of ApprovalInfo entities.
    /// Items in this list may not represent actual votes cast by users;
    /// if a user votes on any label, a corresponding ApprovalInfo will appear in this list for all labels.
    var all: [ApprovalInfo]? { get set }

    /// A map of all values that are allowed for this label.
    /// The map maps the values (“-2”, “-1”, " `0`", “+1”, “+2”) to the value descriptions.
    var values: [Int: String] { get set }
}

/// The NotifyInfo entity contains detailed information about who should
/// be notified about an update. These notifications are sent out even if
/// a notify option in the request input disables normal notifications.
/// NotifyInfo entities are normally contained in a notify_details map in
/// the request input where the key is the recipient type. The recipient
/// type can be TO, CC and BCC.
public protocol NotifyInfo: Codable {

    /// A list of account IDs that identify the accounts that should be should be notified.
    var accounts: [String]? { get set }
}

/// The ProblemInfo entity contains a description of a potential consistency
/// problem with a change. These are not related to the code review process,
/// but rather indicate some inconsistency in Gerrit’s database or repository
/// metadata related to the enclosing change.
public protocol ProblemInfo: Codable {

    /// Plaintext message describing the problem with the change.
    var message: String { get set }

    /// The status of fixing the problem (FIXED, FIX_FAILED). Only set if a fix was attempted.
    var status: String? { get set }

    /// If status is set, an additional plaintext message describing the outcome of the fix.
    var outcome: String? { get set }
}

/// The PureRevertInfo entity describes the result of a pure revert check.
public protocol PureRevertInfo: Codable {

    /// Outcome of the check as boolean.
    var is_pure_revert: Bool { get set }
}

/// The PushCertificateInfo entity contains information about a push certificate
/// provided when the user pushed for review with git push --signed
/// HEAD:refs/for/<branch>. Only used when signed push is enabled on the server.
public protocol PushCertificateInfo: Codable {

    /// Signed certificate payload and GPG signature block.
    var certificate: String { get set }

    // TODO: Check Type
    /// Information about the key that signed the push, along with any problems
    /// found while checking the signature or the key itself, as a GpgKeyInfo entity.
    var key: String { get set }
}

/// The RangeInfo entity stores the coordinates of a range.
public protocol RangeInfo: Codable {
    /// First index.
    var start: Int { get set }
    /// Last index.
    var end: Int { get set }
}
