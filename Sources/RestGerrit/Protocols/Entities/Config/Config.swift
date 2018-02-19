//
//  Config.swift
//  RestGerrit
//
//  Created by Matthew Lui on 19/2/2018.
//  Copyright © 2018 Chatboy.xyz. All rights reserved.
//

import Foundation

/// The AccountsConfigInfo entity contains information about Gerrit configuration from the accounts section.
public protocol AccountsConfigInfo: Codable {

    /// Visibility setting for accounts.
    var visibility: String { get set }
}

/// The AuthInfo entity contains information about the authentication configuration of the Gerrit server.
public protocol AuthInfo: Codable {

    /// The authentication type that is configured on the server. Can be OPENID, OPENID_SSO, OAUTH, HTTP, HTTP_LDAP, CLIENT_SSL_CERT_LDAP, LDAP, LDAP_BIND, CUSTOM_EXTENSION or DEVELOPMENT_BECOME_ANY_ACCOUNT.
    var type: String { get set }

    /// not set if false
    /// Whether contributor agreements are required.
    var use_contributor_agreements: Bool? { get set }

    /// not set if use_contributor_agreements is false
    /// List of contributor agreements as ContributorAgreementInfo entities.
    var contributor_agreements: [ContributorAgreementInfo]? { get set }

    /// List of account fields that are editable. Possible values are FULL_NAME, USER_NAME and REGISTER_NEW_EMAIL.
    var editable_account_fields: [String] { get set }

    /// The login URL. Only set if authentication type is HTTP or HTTP_LDAP.
    var login_url: String? { get set }

    /// The login text. Only set if authentication type is HTTP or HTTP_LDAP.
    var login_text: String? { get set }

    /// The URL to switch accounts.
    var switch_account_url: String? { get set }

    /// The register URL. Only set if authentication type is LDAP, LDAP_BIND or CUSTOM_EXTENSION.
    var register_url: String? { get set }

    /// The register text. Only set if authentication type is LDAP, LDAP_BIND or CUSTOM_EXTENSION.
    var register_text: String? { get set }

    /// The URL to edit the full name. Only set if authentication type is LDAP, LDAP_BIND or CUSTOM_EXTENSION.
    var edit_full_name_url: String? { get set }

    /// The URL to obtain an HTTP password. Only set if authentication type is CUSTOM_EXTENSION.
    var http_password_url: String? { get set }

    /// The policy to authenticate Git over HTTP and REST API requests when authentication type is LDAP. Can be HTTP, LDAP or HTTP_LDAP.
    var git_basic_auth_policy: String? { get set }

}

/// The CacheInfo entity contains information about a cache.
public protocol CacheInfo: Codable {

    /// The cache name. If the cache is defined by a plugin the cache name includes the plugin name: "<plugin-name>-<cache-name>".
    var name: String? { get set }

    /// The type of the cache (MEM: in memory cache, DISK: disk cache).
    var type: String { get set }

    /// Information about the entries in the cache as a EntriesInfo entity.
    var entries: EntriesInfo { get set }

    /// The average duration of getting one entry from the cache. The value is returned with a standard time unit abbreviation (ns: nanoseconds, us: microseconds, ms: milliseconds, s: seconds).
    var average_get: String? { get set }

    /// Information about the hit ratio as a HitRatioInfo entity.
    var hit_ratio: HitRatioInfo { get set }
}

/// TODO: Need to reconsider naming
/// The CacheOperationInput entity contains information about an operation that should be executed on caches.
public protocol Config_CapabilityInfo: Codable {

    /// The cache operation that should be executed:
    ///
    /// FLUSH_ALL: Flushes all caches, except the web_sessions cache.
    ///
    /// FLUSH: Flushes the specified caches.
    var operation: String { get set }

    /// A list of cache names. This list defines the caches on which the specified operation should be executed. Whether this list must be specified depends on the operation being executed.
    var caches: String? { get set }
}

/// The ChangeConfigInfo entity contains information about Gerrit configuration from the change section.
public protocol ChangeConfigInfo: Codable {

    /// not set if false
    /// Whether blame on side by side diff is allowed.
    var allow_blame: Bool? { get set }

    /// Number of changed lines from which on a change is considered as a large change.
    var large_change: UInt? { get set }

    /// not set if false
    /// Returns true if changes are by default created as private. See privateByDefault
    var private_by_default: Bool? { get set }

    /// Label name for the reply button.
    var reply_lable: String { get set }

    /// Tooltip for the reply button.
    var reply_tooltip: String { get set }

    /// How often in seconds the web interface should poll for updates to the currently open change.
    var update_delay: Double { get set }

    /// A configuration if the whole topic is submitted.
    var submit_whole_topic: [String: String] { get set }
}

/// The CheckAccountExternalIdsInput entity contains input for the account external IDs consistency check.
///
/// Currently this entity contains no fields.
public protocol CheckAccountExternalIdsInput { }

/// The CheckAccountExternalIdsResultInfo entity contains the result of running the account external IDs consistency check.
public protocol CheckAccountExternalIdsResultInfo: Codable {

    /// A list of ConsistencyProblemInfo entities.
    var problems: [ConsistencyProblemInfo] { get set }
}

/// The ConsistencyCheckInfo entity contains the results of running consistency checks.
public protocol ConsistencyCheckInfo: Codable {

    /// The result of running the account consistency check as a CheckAccountsResultInfo entity.
    var check_accounts_result: CheckAccountsResultInfo? { get set }

    /// The result of running the account external ID consistency check as a CheckAccountExternalIdsResultInfo entity.
    var check_account_external_ids_result: CheckAccountExternalIdsResultInfo? { get set }
}

public protocol CheckAccountsResultInfo: Codable { }
public protocol CheckAccountsInput: Codable { }

/// The ConsistencyCheckInput entity contains information about which consistency checks should be run.
public protocol ConsistencyCheckInput: Codable {

    /// Input for the account consistency check as CheckAccountsInput entity.
    var check_accounts: CheckAccountsInput? { get set }

    /// Input for the account external ID consistency check as CheckAccountExternalIdsInput entity.
    var check_account_external_ids: CheckAccountExternalIdsInput? { get set }
}

/// The ConsistencyProblemInfo entity contains information about a consistency problem.
public protocol ConsistencyProblemInfo: Codable {

    /// The status of the consistency problem.
    /// Possible values are ERROR and WARNING.
    var status: String { get set }

    /// Message describing the consistency problem.
    var message: String { get set }
}

/// The DownloadInfo entity contains information about supported download options.
public protocol DownloadInfo: Codable {

    /// The supported download schemes as a map which maps the scheme name to a of DownloadSchemeInfo entity.
    var schemes: DownloadSchemeInfo { get set }

    /// List of supported archive formats. Possible values are tgz, tar, tbz2 and txz.
    var archives: [String] { get set }
}

/// The DownloadSchemeInfo entity contains information about a supported download scheme and its commands.
public protocol DownloadSchemeInfo: Codable {

    /// The URL of the download scheme, where '${project}' is used as placeholder for the project name.
    var url: String { get set }

    /// Whether this download scheme requires authentication.
    var is_auth_required: Bool? { get set }

    /// Whether this download scheme requires authentication.
    var is_auth_supported: Bool? { get set }
    /// Download commands as a map which maps the command name to the download command. In the download command '${project}' is used as placeholder for the project name, and '${ref}' is used as placeholder for the (change) ref.
    ///
    /// Empty, if accessed anonymously and the download scheme requires authentication.
    var commands: [String] { get set }

    /// Clone commands as a map which maps the command name to the clone command. In the clone command '${project}' is used as placeholder for the project name and '${project-base-name}' as name for the project base name (e.g. for a project 'foo/bar' '${project}' is a placeholder for 'foo/bar' and '${project-base-name}' is a placeholder for 'bar').
    ///
    /// Empty, if accessed anonymously and the download scheme requires authentication.
    var clone_commands: [String] { get set }

}

/// The EmailConfirmationInput entity contains information for confirming an email address.
public protocol EmailConfirmationInput: Codable {

    /// The token that was sent by mail to a newly registered email address.
    var token: String { get set }
}

/// The EntriesInfo entity contains information about the entries in a cache.
public protocol EntriesInfo: Codable {

    /// Number of cache entries that are held in memory.
    var mem: String? { get set }

    /// Number of cache entries on the disk. For non-disk caches this value is not set; for disk caches it is only set if there are entries in the cache.
    var disk: String? { get set }

    /// The space that is consumed by the cache on disk. The value is returned with a unit abbreviation (k: kilobytes, m: megabytes, g: gigabytes). Only set for disk caches.
    var space: String? { get set }
}

/// The GerritInfo entity contains information about Gerrit configuration from the gerrit section.
public protocol GerritInfo: Codable {

    /// Name of the root project.
    var all_projects_name: String { get set }

    /// Name of the project in which meta data of all users is stored.
    var all_users_name: String { get set }

    /// Whether documentation search is available.
    var doc_search: Bool { get set }

    /// Custom base URL where Gerrit server documentation is located. (Documentation may still be available at /Documentation relative to the Gerrit base path even if this value is unset.)
    var doc_url: String? { get set }

    /// not set if false
    /// Whether to enable the web UI for editing GPG keys.
    var edit_gpg_keys: Bool? { get set }

    /// URL to report bugs.
    var report_bug_url: String? { get set }

    /// optional, not set if default
    /// Display text for report bugs link.
    var report_bug_text: String { get set }

    /// List of web UIs supported by the HTTP server. Possible values are GWT and POLYGERRIT.
    var web_uis: [String] { get set }
}

/// The HitRatioInfo entity contains information about the hit ratio of a cache.
public protocol HitRatioInfo: Codable {

    /// Hit ratio for cache entries that are held in memory (0 <= value <= 100).
    var mem: UInt8 { get set }

    /// Hit ratio for cache entries that are held on disk (0 <= value <= 100). Only set for disk caches.
    var disk: UInt8? { get set }
}

/// The JvmSummaryInfo entity contains information about the JVM.
public protocol JvmSummaryInfo: Codable {

    /// The vendor of the virtual machine.
    var vm_vendor: String { get set }

    /// The name of the virtual machine.
    var vm_name: String { get set }

    /// The version of the virtual machine.
    var vm_version: String { get set }

    /// The name of the operating system.
    var os_name: String { get set }

    /// The version of the operating system.
    var os_version: String { get set }

    /// The architecture of the operating system.
    var os_arch: String { get set }

    /// The user that is running Gerrit.
    var user: String { get set }

    /// The host on which Gerrit is running.
    var host: String? { get set }

    /// The current working directory.
    var current_working_directory: String { get set }

    /// The path to the review site.
    var site: String { get set }
}

/// The MemSummaryInfo entity contains information about the current memory usage.
public protocol MemSummaryInfo: Codable {

    /// The total size of the memory. The value is returned with a unit abbreviation (k: kilobytes, m: megabytes, g: gigabytes).
    var total: String { get set }

    /// The size of used memory. The value is returned with a unit abbreviation (k: kilobytes, m: megabytes, g: gigabytes).
    var used: String { get set }

    /// The size of free memory. The value is returned with a unit abbreviation (k: kilobytes, m: megabytes, g: gigabytes).
    var free: String { get set }

    /// The size of memory used for JGit buffers. The value is returned with a unit abbreviation (k: kilobytes, m: megabytes, g: gigabytes).
    var buffers: String { get set }

    /// The maximal memory size. The value is returned with a unit abbreviation (k: kilobytes, m: megabytes, g: gigabytes).
    var max: String { get set }

    /// The number of open files.
    var open_files: UInt? { get set }
}

/// The PluginConfigInfo entity contains information about Gerrit extensions by plugins.
public protocol PluginConfigInfo: Codable {

    /// not set if false
    /// Whether an avatar provider is registered.
    var has_avatars: Bool? { get set }
}

/// The ReceiveInfo entity contains information about the configuration of git-receive-pack behavior on the server.
public protocol ReceiveInfo: Codable {

    /// Whether signed push validation support is enabled on the server; see the global configuration for details.
    var enableSignedPush: Bool? { get set }
}

/// The ServerInfo entity contains information about the configuration of the Gerrit server.
public protocol ServerInfo: Codable {

    /// Information about the configuration from the accounts section as AccountsConfigInfo entity.
    var accounts: AccountsConfigInfo { get set }

    /// Information about the authentication configuration as AuthInfo entity.
    var auth: AuthInfo { get set }

    /// Information about the configuration from the change section as ChangeConfigInfo entity.
    var change: ChangeConfigInfo { get set }

    /// Information about the configured download options as DownloadInfo entity. information about Gerrit
    var download: DownloadInfo { get set }

    /// Information about the configuration from the gerrit section as GerritInfo entity.
    var gerrit: GerritInfo { get set }

    /// Whether the NoteDb storage backend is fully enabled.
    var note_db_enabled: Bool? { get set }

    /// Information about Gerrit extensions by plugins as PluginConfigInfo entity.
    var plugin: PluginConfigInfo { get set }

    /// Information about the receive-pack configuration as a ReceiveInfo entity.
    var receive: ReceiveInfo? { get set }

    /// Information about the configuration from the sshd section as SshdInfo entity. Not set if SSHD is disabled.
    var sshd: SshdInfo? { get set }

    /// Information about the configuration from the suggest section as SuggestInfo entity.
    var suggest: SuggestInfo { get set }

    /// A map of URL aliases, where a regular expression for an URL token is mapped to a target URL token. The target URL token can contain placeholders for the groups matched by the regular expression: $1 for the first matched group, $2 for the second matched group, etc.
    var url_aliases: [String: String]? { get set }

    /// Information about the configuration from the user section as UserConfigInfo entity.
    var user: UserConfigInfo { get set }

    /// URL to a default PolyGerrit UI theme plugin, if available. Located in /static/gerrit-theme.html by default.
    var default_theme: String? { get set }
}

/// The SshdInfo entity contains information about Gerrit configuration from the sshd section.
///
/// This entity doesn’t contain any data, but the presence of this (empty) entity in the ServerInfo entity means that SSHD is enabled on the server.
public protocol SshdInfo: Codable { }

/// The SuggestInfo entity contains information about Gerrit configuration from the suggest section.
public protocol SuggestInfo: Codable {

    /// The number of characters that a user must have typed before suggestions are provided.
    var from: UInt { get set }
}

/// The SummaryInfo entity contains information about the current state of the server.
public protocol SummaryInfo: Codable {

    /// Summary about current tasks as a TaskSummaryInfo entity.
    var task_summary: TaskSummaryInfo { get set }

    /// Summary about current memory usage as a MemSummaryInfo entity.
    var mem_summary: MemSummaryInfo { get set }

    /// Summary about current threads as a ThreadSummaryInfo entity.
    var thread_summary: ThreadSummaryInfo { get set }

    /// Summary about the JVM JvmSummaryInfo entity. Only set if the jvm option was set.
    var jvm_summary: JvmSummaryInfo? { get set }
}

/// The TaskInfo entity contains information about a task in a background work queue.
public protocol TaskInfo: Codable {

    /// The ID of the task.
    var id: String { get set }

    /// The state of the task, can be:
    /// - DONE, CANCELLED, RUNNING, READY, SLEEPING and OTHER.
    var state: String { get set }

    /// The start time of the task.
    var start_time: String { get set }

    /// The remaining delay of the task.
    var delay: String { get set }

    /// The command of the task.
    var command: String { get set }

    /// The remote name. May only be set for tasks that are associated with a project.
    var remote_name: String? { get set }

    /// The project the task is associated with.
    var project: String? { get set }
}

/// The TaskSummaryInfo entity contains information about the current tasks.
public protocol TaskSummaryInfo: Codable {

    /// Total number of current tasks.
    var total: UInt? { get set }

    /// Number of currently running tasks.
    var running: UInt? { get set }

    /// Number of currently ready tasks.
    var ready: UInt? { get set }

    /// Number of currently sleeping tasks.
    var sleeping: UInt? { get set }
}

/// The ThreadSummaryInfo entity contains information about the current threads.
public protocol ThreadSummaryInfo: Codable {

    /// The number of available processors.
    var cpus: UInt { get set }

    /// The total number of current threads.
    var threads: UInt { get set }

    /// Detailed thread counts as a map that maps a thread kind to a map that maps a thread state to the thread count. The thread kinds group the counts by threads that have the same name prefix (H2, HTTP, IntraLineDiff, ReceiveCommits, SSH git-receive-pack, SSH git-upload-pack, SSH-Interactive-Worker, SSH-Stream-Worker, SshCommandStart, sshd-SshServer). The counts for other threads are available under the thread kind Other. Counts for the following thread states can be included: NEW, RUNNABLE, BLOCKED, WAITING, TIMED_WAITING and TERMINATED.
    var counts: [String: UInt] { get set }
}

/// The TopMenuEntryInfo entity contains information about a top menu entry.
public protocol TopMenuEntryInfo: Codable {

    /// Name of the top menu entry.
    var name: String { get set }

    /// List of menu items.
    var items: [TopMenuItemInfo] { get set }
}

/// The TopMenuItemInfo entity contains information about a menu item in a top menu entry.
public protocol TopMenuItemInfo: Codable {

    /// The URL of the menu item link.
    var url: String { get set }

    /// The name of the menu item.
    var name: String { get set }

    /// Target attribute of the menu item link.
    var target: String { get set }

    /// The id attribute of the menu item link.
    var id: String? { get set }
}

/// The UserConfigInfo entity contains information about Gerrit configuration from the user section.
public protocol UserConfigInfo: Codable {

    /// Username that is displayed in the Gerrit Web UI and in e-mail notifications if the full name of the user is not set.
    var anonymous_coward_name: String { get set }
}
