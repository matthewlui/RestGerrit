//
//  Account.swift
//  RestGerrit
//
//  Created by Matthew Lui on 18/2/2018.
//  Copyright © 2018 Chatboy.xyz. All rights reserved.
//

import Foundation

/// The AccountInfo entity contains information about an account.
public protocol AccountInfo: Codable {
    /// The numeric ID of the account.
    var _account_id: NumericId { get set }

    /// The full name of the user.
    /// Only set if detailed account information is requested.
    /// See option DETAILED_ACCOUNTS for change queries
    /// and option DETAILS for account queries.
    var name: String? { get set }

    /// The email address the user prefers to be contacted through.
    /// Only set if detailed account information is requested.
    /// See option DETAILED_ACCOUNTS for change queries
    /// and options DETAILS and ALL_EMAILS for account queries.

    /// A list of the secondary email addresses of the user.
    /// Only set for account queries when the ALL_EMAILS option is set.

    /// A list of the secondary email addresses of the user.
    /// Only set for account queries when the ALL_EMAILS option is set.

    /// The username of the user.
    /// Only set if detailed account information is requested.
    /// See option DETAILED_ACCOUNTS for change queries
    /// and option DETAILS for account queries.

    /// Whether the query would deliver more results if not limited.
    /// Only set on the last account that is returned.

}

/// The AccountInput entity contains information for the creation of a new account.
public protocol AccountInput: Codable {

    /// The user name. If provided, must match the user name from the URL.
    var username: String? { get set }

    /// The full name of the user.
    var name: String? { get set }

    /// The email address of the user.
    var email: String? { get set }

    /// The public SSH key of the user.
    var ssh_key: String? { get set }

    /// The HTTP password of the user.
    var http_password: String? { get set }

    /// A list of group IDs that identify the groups to which the user should be added.
    var groups: [String]? { get set }

}

/// The AccountNameInput entity contains information for setting a name for an account.
public protocol AccountNameInput: Codable {

    /// The new full name of the account.
    /// If not set or if set to an empty string, the account name is deleted.
    var name: String? { get set }

}

/// The AccountStatusInput entity contains information for setting a status for an account.
public protocol AccountStatusInput: Codable {

    /// The new status of the account.
    /// If not set or if set to an empty string, the account status is deleted.
    var status: String? { get set }
}

/// The CapabilityInfo entity contains information about the global capabilities of a user.
public protocol CapabilityInfo: Codable {

    /// not set if false
    /// Whether the user has the Access Database capability.
    var accessDatabase: Bool? { get set }

    /// not set if false
    /// Whether the user has the Administrate Server capability.
    var administrateServer: Bool? { get set }

    /// not set if false
    /// Whether the user has the Create Account capability.
    var createAccount: Bool? { get set }

    /// not set if false
    /// Whether the user has the Create Group capability.
    var createGroup: Bool? { get set }

    /// not set if false
    /// Whether the user has the Create Project capability.
    var createProjects: Bool? { get set }

    /// not set if false
    /// Whether the user has the Email Reviewers capability.
    var emailReviewers: Bool? { get set }

    /// not set if false
    /// Whether the user has the Flush Caches capability.
    var flushCaches: Bool? { get set }

    /// not set if false
    /// Whether the user has the Kill Task capability.
    var killTask: Bool? { get set }

    /// not set if false
    /// Whether the user has the Maintain Server capability.
    var maintainServer: Bool? { get set }

    /// not set if false
    /// The name of the thread pool used by the user, see Priority capability.
    var priority: Bool? { get set }

    /// The Query Limit of the user as QueryLimitInfo.
    var queryLimit: QueryLimitInfo { get set }

    /// not set if false
    /// Whether the user has the Run As capability.
    var runAs: Bool? { get set }

    /// not set if false
    /// Whether the user has the Run Garbage Collection capability.
    var runGC: Bool? { get set }

    /// not set if false
    /// Whether the user has the Stream Events capability.
    var streamEvents: Bool? { get set }

    /// not set if false
    /// Whether the user has the View All Accounts capability.
    var viewAllAccounts: Bool? { get set }

    /// not set if false
    /// Whether the user has the View Caches capability.
    var viewCaches: Bool? { get set }

    /// not set if false
    /// Whether the user has the View Connections capability.
    var viewConnections: Bool? { get set }

    /// not set if false
    /// Whether the user has the View Plugins capability.
    var viewPlugins: Bool? { get set }

    /// not set if false
    /// Whether the user has the View Queue capability.
    var viewQueue: Bool? { get set }
}

/// The ContributorAgreementInfo entity contains information about a contributor agreement.
public protocol ContributorAgreementInfo: Codable {

    /// The name of the agreement.
    var name: String? { get set }

    /// The description of the agreement.
    var description: String? { get set }

    /// The URL of the agreement.
    var url: String? { get set }
}

/// The ContributorAgreementInput entity contains information about a new contributor agreement.
public protocol ContributorAgreementInput: Codable {

    /// The name of the agreement.
    var name: String { get set }
}

/// The DiffPreferencesInfo entity contains information about the diff preferences of a user.
public protocol DiffPreferencesInfo: Codable {

    /// The number of lines of context when viewing a patch.
    var context: UInt { get set }

    /// The CodeMirror theme name in upper case, for example DEFAULT. All the themes from the CodeMirror release that Gerrit is using are available.
    var theme: String { get set }

    /// not set if false
    /// Whether all inline comments should be automatically expanded.
    var expand_all_comments: Bool? { get set }

    /// Whether whitespace changes should be ignored and if yes, which whitespace changes should be ignored.
    /// Allowed values are IGNORE_NONE, IGNORE_TRAILING, IGNORE_LEADING_AND_TRAILING, IGNORE_ALL.
    var ignore_whitespace: String { get set }

    /// not set if false
    /// Whether intraline differences should be highlighted.
    var intraline_difference: Bool? { get set }

    /// Number of characters that should be displayed in one line.
    var line_length: UInt { get set }

    /// Half-period in milliseconds used for cursor blinking. Setting it to 0 disables cursor blinking.
    var cursor_blink_rate: UInt { get set }

    /// not set if false
    /// Whether the 'Reviewed' flag should not be set automatically on a patch when it is viewed.
    var manual_review: Bool? { get set }

    /// not set if false
    /// Whether the header that is displayed above the patch (that either shows the commit message, the diff preferences, the patch sets or the files) should be retained on file switch.
    var retain_header: Bool? { get set }

    /// not set if false
    /// Whether Windows EOL/Cr-Lf should be displayed as '\r' in a dotted-line box.
    var show_line_endings: Bool? { get set }

    /// not set if false
    /// Whether tabs should be shown.
    var show_tabs: Bool? { get set }

    /// not set if false
    /// Whether uncommented files should be skipped on file switch.
    var show_whitespace_errors: Bool? { get set }

    /// not set if false
    /// Whether deleted files should be skipped on file switch.
    var skip_deleted: Bool? { get set }

    /// not set if false
    /// Whether uncommented files should be skipped on file switch.
    var skip_uncommented: Bool? { get set }

    /// not set if false
    /// Whether syntax highlighting should be enabled.
    var syntax_highlighting: Bool? { get set }

    /// not set if false
    /// If true the top menu header and site header are hidden.
    var hide_top_menu: Bool? { get set }

    /// not set if false
    /// If true the diff table header is automatically hidden when scrolling down more than half of a page.
    var auto_hide_diff_table_header: Bool? { get set }

    /// not set if false
    /// If true the line numbers are hidden.
    var hide_line_numbers: Bool? { get set }

    /// Number of spaces that should be used to display one tab.
    var tab_size: UInt { get set }

    /// Default font size in pixels for change to be displayed in the diff view.
    var font_size: UInt { get set }

    /// not set if false
    /// Whether empty panes should be hidden. The left pane is empty when a file was added; the right pane is empty when a file was deleted.
    var hide_empty_pane: Bool? { get set }

    /// not set if false
    /// Whether matching brackets should be highlighted.
    var match_brackets: Bool? { get set }

    /// not set if false
    /// Whether to enable line wrapping or not.
    var line_wrapping: Bool? { get set }
}

// TODO: Combine common field with DiffPreferencesInfo
// The DiffPreferencesInput entity contains information for setting the diff preferences of a user. Fields which are not set will not be updated.
public protocol DiffPreferencesInput: Codable {

    /// The number of lines of context when viewing a patch.
    var context: UInt? { get set }

    /// Whether all inline comments should be automatically expanded.
    var expand_all_comments: Bool? { get set }

    /// Whether whitespace changes should be ignored and if yes, which whitespace changes should be ignored.
    /// Allowed values are IGNORE_NONE, IGNORE_TRAILING, IGNORE_LEADING_AND_TRAILING, IGNORE_ALL.
    var ignore_whitespace: Bool? { get set }

    /// Whether intraline differences should be highlighted.
    var intraline_difference: Bool? { get set }

    /// Number of characters that should be displayed in one line.
    var line_length: UInt? { get set }

    /// Whether the 'Reviewed' flag should not be set automatically on a patch when it is viewed.
    var manual_review: Bool? { get set }

    /// Whether the header that is displayed above the patch (that either shows the commit message, the diff preferences, the patch sets or the files) should be retained on file switch.
    var retain_header: Bool? { get set }

    /// Whether Windows EOL/Cr-Lf should be displayed as '\r' in a dotted-line box.
    var show_line_endings: Bool? { get set }

    /// Whether tabs should be shown.
    var show_tabs: Bool? { get set }

    /// Whether whitespace errors should be shown.
    var show_whitespace_errors: Bool? { get set }

    /// Whether deleted files should be skipped on file switch.
    var skip_deleted: Bool? { get set }

    /// Whether uncommented files should be skipped on file switch
    var skip_uncommented: Bool? { get set }

    /// Whether syntax highlighting should be enabled.
    var syntax_highlighting: Bool? { get set }

    /// True if the top menu header and site header should be hidden.
    var hide_top_menu: Bool? { get set }

    /// True if the diff table header is automatically hidden when scrolling down more than half of a page.
    var auto_hide_diff_table_header: Bool? { get set }

    /// True if the line numbers should be hidden.
    var hide_line_numbers: Bool? { get set }

    /// Number of spaces that should be used to display one tab.
    var tab_size: Bool? { get set }

    /// Default font size in pixels for change to be displayed in the diff view.
    var font_size: Bool? { get set }

    /// Whether to enable line wrapping or not.
    var line_wrapping: Bool? { get set }

    /// Whether to enable indent with tabs or not.
    var indent_with_tabs: Bool? { get set }

}

// TODO: Combine??
// The EditPreferencesInfo entity contains information about the edit preferences of a user.
public protocol EditPreferencesInfo: Codable {

    /// The CodeMirror theme name in upper case, for example DEFAULT. All the themes from the CodeMirror release that Gerrit is using are available.
    var theme: String { get set }

    /// The CodeMirror key map. Currently only a subset of key maps are supported: DEFAULT, EMACS, SUBLIME, VIM.
    var key_map_type: String { get set }

    /// Number of spaces that should be used to display one tab.
    var tab_size: UInt { get set }

    /// Number of characters that should be displayed per line.
    var line_length: UInt { get set }

    /// Number of spaces that should be used for auto-indent.
    var indent_unit: UInt { get set }

    /// Half-period in milliseconds used for cursor blinking. Setting it to 0 disables cursor blinking.
    var cursor_blink_rate: UInt { get set }

    /// not set if false
    /// If true the top menu header and site header is hidden.
    var hide_top_menu: Bool? { get set }

    /// not set if false
    /// Whether tabs should be shown.
    var show_tabs: Bool? { get set }

    /// not set if false
    /// Whether whitespace errors should be shown.
    var show_whitespace_errors: Bool? { get set }

    /// not set if false
    /// Whether syntax highlighting should be enabled.
    var syntax_highlighting: Bool? { get set }

    /// not set if false
    /// Whether line numbers should be hidden.
    var hide_line_numbers: Bool? { get set }

    /// not set if false
    /// Whether matching brackets should be highlighted.
    var match_brackets: Bool? { get set }

    /// not set if false
    /// Whether to enable line wrapping or not.
    var line_wrapping: Bool? { get set }

    /// not set if false
    /// Whether brackets and quotes should be auto-closed during typing.
    var auto_close_brackets: Bool? { get set }

}

/// The EmailInfo entity contains information about an email address of a user.
public protocol EmailInfo: Codable {

    /// The email address.
    var email: String { get set }

    /// not set if false
    /// Whether this is the preferred email address of the user.
    var preferred: Bool? { get set }

    /// not set if false
    /// Set true if the user must confirm control of the email address by following a verification link before Gerrit will permit use of this address.
    var pending_confirmation: Bool? { get set }
}

// TODO: Combine??
/// The EmailInput entity contains information for registering a new email address.
public protocol EmailInput: Codable {

    /// The email address. If provided, must match the email address from the URL.
    var email: String { get set }

    /// false if not set
    /// Whether the new email address should become the preferred email address of the user (only supported if no_confirmation is set or if the authentication type is DEVELOPMENT_BECOME_ANY_ACCOUNT).
    var preferred: Bool? { get set }

    /// false if not set
    /// Whether the email address should be added without confirmation. In this case no verification email is sent to the user.
    /// Only Gerrit administrators are allowed to add email addresses without confirmation.
    var no_confirmation: Bool? { get set }
}

/// The GpgKeyInfo entity contains information about a GPG public key.
public protocol GpgKeyInfo: Codable {

    /// Not set in map context
    /// The 8-char hex GPG key ID.
    var id: String? { get set }

    /// Not set for deleted keys
    /// The 40-char (plus spaces) hex GPG key fingerprint.
    var fingerprint: String? { get set }

    /// Not set for deleted keys
    /// OpenPGP User IDs associated with the public key.
    var user_ids: [String]? { get set }

    /// Not set for deleted keys
    /// ASCII armored public key material.
    var key: String? { get set }

    /// Not set for deleted keys
    /// The result of server-side checks on the key; one of BAD, OK, or TRUSTED. BAD keys have serious problems and should not be used. If a key is OK, inspecting only that key found no problems, but the system does not fully trust the key’s origin. A `TRUSTED key is valid, and the system knows enough about the key and its origin to trust it.
    var status: String? { get set }

    /// Not set for deleted keys
    /// A list of human-readable problem strings found in the course of checking whether the key is valid and trusted.
    var problems: [String]? { get set }
}

/// The GpgKeysInput entity contains information for adding/deleting GPG keys.
public protocol GpgKeysInput: Codable {

    /// List of ASCII armored public key strings to add.
    var add: [String] { get set }

    /// List of {gpg-key-id}s to delete.
    var delete: [String] { get set }
}

/// The HttpPasswordInput entity contains information for setting/generating an HTTP password.
public protocol HttpPasswordInput: Codable {

    /// false if not set
    /// Whether a new HTTP password should be generated
    var generate: Bool? { get set }

    /// The new HTTP password. Only Gerrit administrators may set the HTTP password directly.
    /// If empty or not set and generate is false or not set, the HTTP password is deleted.
    var http_password: String? { get set }
}

/// The OAuthTokenInfo entity contains information about an OAuth access token.
public protocol OAuthTokenInfo: Codable {

    /// The owner of the OAuth access token.
    var username: String { get set }

    /// The host of the Gerrit instance.
    var resource_host: String { get set }

    /// The actual token value.
    var access_token: String { get set }

    /// The identifier of the OAuth provider in the form plugin-name:provider-name.
    var provider_id: String { get set }

    /// Time of expiration of this token in milliseconds.
    var expires_at: String { get set }

    /// The type of the OAuth access token, always bearer.
    var type: String { get set }
}

/// The PreferencesInfo entity contains information about a user’s preferences.
protocol PreferencesInfo: Codable {

    /// The number of changes to show on each page. Allowed values are 10, 25, 50, 100.
    var changes_per_page: String { get set }

    /// not set if false
    /// Whether the site header should be shown.
    var show_site_header: Bool? { get set }

    /// not set if false
    /// Whether to use the flash clipboard widget.
    var use_flash_clipboard: Bool? { get set }

    /// not set if false
    /// Whether to expand diffs inline instead of opening as separate page (PolyGerrit only).
    var expand_inline_diffs: Bool? { get set }

    /// The type of download URL the user prefers to use. May be any key from the schemes map in DownloadInfo.
    var download_scheme: String? { get set }

    /// The type of download command the user prefers to use.
    var download_command: String? { get set }

    /// The format to display the date in. Allowed values are STD, US, ISO, EURO, UK.
    var date_format: String { get set }

    /// The format to display the time in. Allowed values are HHMM_12, HHMM_24.
    var time_format: String { get set }

    /// not set if false
    /// Whether to show relative dates in the changes table.
    var relative_date_in_chang_table: Bool? { get set }

    /// The type of diff view to show. Allowed values are SIDE_BY_SIDE, UNIFIED_DIFF.
    var diff_view: String { get set }

    /// not set if false
    /// Whether to show the change sizes as colored bars in the change table.
    var size_bar_in_change_table: Bool? { get set }

    /// not set if false
    /// Whether to show change number in the change table.
    var legacycid_in_change_table: Bool? { get set }

    /// The strategy used to displayed info in the review category column. Allowed values are NONE, NAME, EMAIL, USERNAME, ABBREV.
    var review_category_strategy: String { get set }

    /// not set if false
    /// Whether to mute common path prefixes in file names in the file table.
    var mute_common_path_prefixes: Bool? { get set }

    /// not set if false
    /// Whether to insert Signed-off-by footer in changes created with the inline edit feature.
    var signed_off_by: Bool? { get set }

    /// The menu items of the MY top menu as a list of TopMenuItemInfo entities.
    var my: [TopMenuItemInfo] { get set }

    /// The columns to display in the change table (PolyGerrit only). The default is empty, which will default columns as determined by the frontend.
    var change_table: UInt? { get set }

    /// A map of URL path pairs, where the first URL path is an alias for the second URL path.
    var url_aliases: [String: String]? { get set }

    /// The type of email strategy to use. On ENABLED, the user will receive emails from Gerrit. On CC_ON_OWN_COMMENTS the user will also receive emails for their own comments. On DISABLED the user will not receive any email notifications from Gerrit. Allowed values are ENABLED, CC_ON_OWN_COMMENTS, DISABLED.
    var email_strategy: String? { get set }

    /// The base which should be pre-selected in the 'Diff Against' drop-down list when the change screen is opened for a merge commit. Allowed values are AUTO_MERGE and FIRST_PARENT.
    var default_base_for_merges: String? { get set }

    /// not set if false
    /// Whether to publish draft comments on push by default.
    var publish_comments_on_push: Bool? { get set }
}

/// The PreferencesInput entity contains information for setting the user preferences. Fields which are not set will not be updated.
public protocol PreferencesInput: Codable {

    /// The number of changes to show on each page. Allowed values are 10, 25, 50, 100.
    var changes_per_pages: UInt? { get set }

    /// Whether the site header should be shown.
    var show_site_header: Bool? { get set }

    /// Whether to use the flash clipboard widget.
    var use_flash_clipboard: Bool? { get set }

    /// Whether to expand diffs inline instead of opening as separate page (PolyGerrit only).
    var expand_inline_diffs: Bool? { get set }

    /// The type of download URL the user prefers to use.
    var download_scheme: String? { get set }

    /// The type of download command the user prefers to use.
    var download_command: String? { get set }

    /// The format to display the date in. Allowed values are STD, US, ISO, EURO, UK.
    var date_format: String? { get set }

    /// The format to display the time in. Allowed values are HHMM_12, HHMM_24.
    var time_format: String? { get set }

    /// Whether to show relative dates in the changes table.
    var relative_date_in_change_table: String? { get set }

    /// The type of diff view to show. Allowed values are SIDE_BY_SIDE, UNIFIED_DIFF.
    var diff_view: String? { get set }

    /// Whether to show the change sizes as colored bars in the change table.
    var size_bar_in_change_table: String? { get set }

    /// TODO: Check API
    /// Whether to show change number in the change table.
    var legacycid_in_change_table: String? { get set }

    /// The strategy used to displayed info in the review category column. Allowed values are NONE, NAME, EMAIL, USERNAME, ABBREV.
    var review_category_strategy: String? { get set }

    /// Whether to mute common path prefixes in file names in the file table.
    var mute_common_path_prefixes: String? { get set }

    /// Whether to insert Signed-off-by footer in changes created with the inline edit feature.
    var signed_off_by: String? { get set }

    /// The menu items of the MY top menu as a list of TopMenuItemInfo entities.
    var my: [TopMenuItemInfo]? { get set }

    /// The columns to display in the change table (PolyGerrit only). The default is empty, which will default columns as determined by the frontend.
    var change_table: UInt? { get set }

    /// A map of URL path pairs, where the first URL path is an alias for the second URL path.
    var url_aliases: [String: String]? { get set }

    /// The type of email strategy to use. On ENABLED, the user will receive emails from Gerrit. On CC_ON_OWN_COMMENTS the user will also receive emails for their own comments. On DISABLED the user will not receive any email notifications from Gerrit. Allowed values are ENABLED, CC_ON_OWN_COMMENTS, DISABLED.
    var email_strategy: String? { get set }

    /// The base which should be pre-selected in the 'Diff Against' drop-down list when the change screen is opened for a merge commit. Allowed values are AUTO_MERGE and FIRST_PARENT.
    var default_base_for_merges: String? { get set }
}

/// The QueryLimitInfo entity contains information about the Query Limit of a user.
public protocol QueryLimitInfo: Codable {

    /// Lower limit
    var min: UInt { get set }

    /// Upper limit
    var max: UInt { get set }
}

/// The SshKeyInfo entity contains information about an SSH key of a user.
public protocol SshKeyInfo: Codable {

    /// The sequence number of the SSH key.
    var seq: Int { get set }

    /// The complete public SSH key.
    var ssh_public_key: String { get set }

    /// The encoded key.
    var encoded_key: String { get set }

    /// The algorithm of the SSH key.
    var algorithm: String { get set }

    /// The comment of the SSH key.
    var comment: String? { get set }

    /// Whether the SSH key is valid.
    var valid: String { get set }
}

/// The StarsInput entity contains star labels that should be added to or removed from a change.
public protocol StarsInput: Codable {

    /// List of labels to add to the change.
    var add: [String]? { get set }

    /// List of labels to remove from the change.
    var remove: [String]? { get set }

}

/// The UsernameInput entity contains information for setting the username for an account.
public protocol UsernameInput: Codable {

    /// The new username of the account.
    var username: String { get set }
}

/// The WatchedProjectsInfo entity contains information about a project watch for a user.
public protocol ProjectWatchInfo: Codable {

    /// The name of the project.
    var project: String { get set }

    /// A filter string to be applied to the project.
    var filter: [String]? { get set }

    /// Notify on new changes.
    var notify_new_changes: Bool? { get set }

    /// Notify on new patch sets.
    var notify_new_patch_sets: Bool? { get set }

    /// Notify on comments.
    var notify_all_comments: Bool? { get set }

    /// Notify on submitted changes.
    var notify_submitted_changes: Bool? { get set }

    /// Notify on abandoned changes.
    var notify_abandoned_changes: Bool? { get set }
}
