package YaPI::HTTPDModules;
%modules = (
    'access' => {
                    summary   => 'Provides access control based on client host name, IP address, etc.',
                    packages  => [],
                    default   => 1,
                    required  => 0,
                    suggested => 0,
                    position  => 10,
		    directives=> [ { option => "Allow", "context" => [ "Directory" ] }, 
				   { option => "Deny",  "context" => [ "Directory" ] },
				   { option =>  "Order",     "context" => [ "Directory" ], "values" => [ "Deny,Allow", "Allow,Deny", "Mutual-failure" ] }
				 ]
    },
    'actions' => {
                    summary   => 'Executing CGI scripts based on media type or request method',
                    packages  => [],
                    default   => 1,
                    required  => 0,
                    suggested => 0,
                    position  => 20,
		    directives=> [ { option => "Action", "context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "Script", "context" => [ "Directory", "Server", "Virtual" ] }
				 ]
    },
    'alias' => {
                    summary   => 'Mapping different parts of the host file system in the document tree and for URL redirection',
                    packages  => [],
                    default   => 1,
                    required  => 0,
                    suggested => 0,
                    position  => 30,
                    directives=> [ { option => "Alias", 		"context" => [ "Server", "Virtual" ] },
				   { option => "AliasMatch", 		"context" => [ "Server", "Virtual" ] },
				   { option => "Redirect", 		"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "RedirectMatch", 	"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "RedirectPermanent", 	"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "RedirectTemp", 		"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "ScriptAlias", 		"context" => [ "Server", "Virtual" ] },
				   { option => "ScriptAliasMatch",	"context" => [ "Server", "Virtual" ] }
				]
    },
    'auth' => {
                    summary   => 'User authentication using text files',
                    packages  => [],
                    default   => 1,
                    required  => 0,
                    suggested => 0,
                    position  => 40,
		    directives=> [ { option => "AuthAuthoritative", "context" => [ "Directory" ] , "values" => [ "On", "Off" ] },
				   { option => "AuthGroupFile",     "context" => [ "Directory" ] },
				   { option => "AuthUserFile", 	    "context" => [ "Directory" ] }
				]
    },
    'auth_dbm' => {
                    summary   => 'Provides for user authentication using DBM files',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 50,
                    module    => {
                                    AuthDBMAuthoritative => 'mod_auth_dbm',
                                    AuthDBMGroupFile => 'mod_auth_dbm',
                                    AuthDBMType => 'mod_auth_dbm',
                                    AuthDBMUserFile => 'mod_auth_dbm'
                    },
                    directives=> [ { option => "AuthDBMAuthoritative", "context" => [ "Directory" ] , "values" => [ "On", "Off" ] },
				   { option => "AuthDBMGroupFile",     "context" => [ "Directory" ] },
				   { option => "AuthDBMType", 	       "context" => [ "Directory" ] , 
										"values" => [ "default", "SDBM", "GDBM", "NDBM", "DB" ] },
				   { option => "AuthDBMUserFile",      "context" => [ "Directory" ] }
				]
    },
    'autoindex' => {
                    summary   => 'Generates directory indices, automatically, similar to the Unix ls command',
                    packages  => [],
                    default   => 1,
                    required  => 0,
                    suggested => 0,
                    position  => 60,
                    directives=> [ { option => "AddAlt", 		"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "AddAltByEncoding", 	"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "AddAltByType", 		"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "AddDescription", 	"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "AddIcon", 		"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "AddIconByEncoding", 	"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "AddIconByType", 	"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "DefaultIcon", 		"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "HeaderName", 		"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "IndexIgnore", 		"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "IndexOptions", 		"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "IndexOrderDefault", 	"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "ReadmeName", 		"context" => [ "Directory", "Server", "Virtual" ] }
				]
    },
    'cgi' => {
                    summary   => 'Execution of CGI scripts',
                    packages  => [],
                    default   => 1,
                    required  => 0,
                    suggested => 0,
                    position  => 70,
                    directives=> [ { option => "ScriptLog", 		"context" => [ "Server", "Virtual" ] },
				   { option => "ScriptLogBuffer", 	"context" => [ "Server", "Virtual" ] },
				   { option => "ScriptLogLength", 	"context" => [ "Server", "Virtual" ] }
				]
    },
    'dir' => {
                    summary   => 'Provides for "trailing slash" redirects and serving directory index files',
                    packages  => [],
                    default   => 1,
                    required  => 0,
                    suggested => 0,
                    position  => 80,
                    directives=> [ { option => "DirectoryIndex", "context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "DirectorySlash", "context" => [ "Directory", "Server", "Virtual" ] , "values" => [ "On", "Off" ] }
				]
    },
    'env' => {
                    summary   => 'Modifies the environment passed to CGI scripts and SSI pages',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 90,
                    directives=> [ { option => "PassEnv",  "context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "SetEnv",   "context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "UnsetEnv", "context" => [ "Directory", "Server", "Virtual" ] } 
				]
    },
    'expires' => {
                    summary   => 'Generation of Expires HTTP headers according to user-specified criteria',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 100,
                    module    => {
                                    ExpiresActive  => 'mod_expires',
                                    ExpiresByType  => 'mod_expires',
                                    ExpiresDefault => 'mod_expires'
                    },
                    directives=> [ { option => "ExpiresActive",  "context" => [ "Directory", "Server", "Virtual" ] , "values" => [ "On", "Off" ] },
				   { option => "ExpiresByType",  "context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "ExpiresDefault", "context" => [ "Directory", "Server", "Virtual" ] } 
				]
    },
    'include' => {
                    summary   => 'Server-parsed HTML documents (Server Side Includes)',
                    packages  => [],
                    default   => 1,
                    required  => 0,
                    suggested => 0,
                    position  => 110,
                    directives=> [ { option => "SSIEndTag", 		"context" => [ "Server", "Virtual" ] },
				   { option => "SSIErrorMsg", 		"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "SSIStartTag", 		"context" => [ "Server", "Virtual" ] },
				   { option => "SSITimeFormat", 	"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "SSIUndefinedEcho", 	"context" => [ "Server", "Virtual" ] },
				   { option => "XBitHack", 		"context" => [ "Directory", "Server", "Virtual" ], 
														"values" => [ "On", "Off", "Full" ] }
				]
    },
    'log_config' => {
                    summary   => 'Logging of the requests made to the server',
                    packages  => [],
                    default   => 1,
                    required  => 0,
                    suggested => 0,
                    position  => 120,
                    directives=> [ { option => "BufferedLogs",  "context" => [ "Server" ] , "values" => [ "On", "Off" ] },
				   { option => "CookieLog",   	"context" => [ "Server", "Virtual" ] },
				   { option => "CustomLog",     "context" => [ "Server", "Virtual" ] },
				   { option => "LogFormat",   	"context" => [ "Server", "Virtual" ] },
				   { option => "TransferLog", 	"context" => [ "Server", "Virtual" ] } 
				]
    },
    'mime' => {
                    summary   => 'Associates the requested file name\'s extensions with the file\'s behavior and content',
                    packages  => [],
                    default   => 1,
                    required  => 0,
                    suggested => 0,
                    position  => 130,
                    directives=> [ { option => "AddCharset", 			"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "AddEncoding", 			"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "AddHandler", 			"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "AddInputFilter",		"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "AddLanguage", 			"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "AddOutputFilter", 		"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "AddType", 			"context" => [ "Directory", "Server", "Virtual" ] },
                                   { option => "DefaultLanguage",               "context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "ModMimeUsePathInfo",		"context" => [ "Directory" ], "values" => [ "On", "Off" ] },
				   { option => "MultiviewsMatch", 		"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "RemoveCharset", 		"context" => [ "Directory", "Virtual" ] },
				   { option => "RemoveEncoding", 		"context" => [ "Directory", "Virtual" ] },
				   { option => "RemoveHandler", 		"context" => [ "Directory", "Virtual" ] },
				   { option => "RemoveInputFilter", 		"context" => [ "Directory", "Virtual" ] },
				   { option => "RemoveLanguage", 		"context" => [ "Directory", "Virtual" ] },
				   { option => "RemoveOutputFilter", 		"context" => [ "Directory", "Virtual" ] },
				   { option => "RemoveType", 			"context" => [ "Directory", "Virtual" ] },
				   { option => "TypesConfig", 			"context" => [ "Server" ] }
				]
    },
    'negotiation' => {
                    summary   => 'Provides for content negotiation',
                    packages  => [],
                    default   => 1,
                    required  => 0,
                    suggested => 0,
                    position  => 140,
                    directives=> [ { option => "CacheNegotiatedDocs", 	"context" => [ "Server", "Virtual" ], "values" => [ "On", "Off" ] },
				   { option => "ForceLanguagePriority", "context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "LanguagePriority", 	"context" => [ "Directory", "Server", "Virtual" ] }
				]
    },
    'setenvif' => {
                    summary   => 'Allows the setting of environment variables based on characteristics of the request',
                    packages  => [],
                    default   => 1,
                    required  => 0,
                    suggested => 0,
                    position  => 150,
                    directives=> [ { option => "BrowserMatch", 		"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "BrowserMatchNoCase", 	"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "SetEnvIf", 		"context" => [ "Directory", "Server", "Virtual" ] },
				   { option => "SetEnvIfNoCase", 	"context" => [ "Directory", "Server", "Virtual" ] }
				]
    },
    'status' => {
                    summary   => 'Provides information about server activity and performance',
                    packages  => [],
                    default   => 1,
                    required  => 0,
                    suggested => 0,
                    position  => 160,
                    directives=> [ { option => "ExtendedStatus", "context" => [ "Server" ], "values" => [ "On", "Off" ] } 
				]
    },
    'suexec' => {
                    summary   => 'Allows CGI scripts to run as a specified user and group',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 0,
                    module    => {
                                    SuexecUserGroup => 'mod_suexec',
                    },
                    directives=> [ { option =>"SuexecUserGroup", "context" => [ "Server", "Virtual" ] } 
				]
    },
    'userdir' => {
                    summary   => 'User-specific directories',
                    packages  => [],
                    default   => 1,
                    required  => 0,
                    suggested => 0,
                    position  => 180,
                    directives=> [ { option =>"UserDir", "context" => [ "Server", "Virtual" ] } 
				]
    },
    'asis' => {
                    summary   => 'Sends files that contain their own HTTP headers',
                    packages  => [],
                    default   => 1,
                    required  => 0,
                    suggested => 0,
                    position  => 190,
                    directives=> [ { option =>"AddHandler", "context" => [ "Directory", "Server", "Virtual" ] } 
				]
    },
    'auth_anon' => {
                    summary   => 'Allows "anonymous" user access to authenticated areas',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 200,
                    module    => { 
                                    Anonymous => 'mod_auth_anon',
                                    Anonymous_Authoritative => 'mod_auth_anon',
                                    Anonymous_LogEmail => 'mod_auth_anon',
                                    Anonymous_MustGiveEmail => 'mod_auth_anon',
                                    Anonymous_NoUserID => 'mod_auth_anon',
                                    Anonymous_VerifyEmail => 'mod_auth_anon'
                    },
                    directives=> [ { option =>"Anonymous", 			"context" => [ "Directory" ] },
				   { option =>"Anonymous_Authoritative", 	"context" => [ "Directory" ], "values" => [ "On", "Off" ] },
				   { option =>"Anonymous_LogEmail", 		"context" => [ "Directory" ], "values" => [ "On", "Off" ] },
				   { option =>"Anonymous_MustGiveEmail", 	"context" => [ "Directory" ], "values" => [ "On", "Off" ] },
				   { option =>"Anonymous_NoUserID", 		"context" => [ "Directory" ] },
				   { option =>"Anonymous_VerifyEmail", 		"context" => [ "Directory" ], "values" => [ "On", "Off" ] }
				]
    },
    'auth_digest' => {
                    summary   => 'User authentication using MD5 Digest Authentication',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 210,
                    directives=> [ { option =>"AuthDigestAlgorithm", 		"context" => [ "Directory" ], "values" => [ "MD5", "MD5-sess" ] },
				   { option =>"AuthDigestDomain", 		"context" => [ "Directory" ] },
				   { option =>"AuthDigestFile", 		"context" => [ "Directory" ] },
				   { option =>"AuthDigestGroupFile", 		"context" => [ "Directory" ] },
				   { option =>"AuthDigestNcCheck", 		"context" => [ "Server" ], "values" => [ "On", "Off" ] },
				   { option =>"AuthDigestNonceFormat", 		"context" => [ "Directory" ] },
				   { option =>"AuthDigestNonceLifetime", 	"context" => [ "Directory" ] },
				   { option =>"AuthDigestQop", 			"context" => [ "Directory" ] },
				   { option =>"AuthDigestShmemSize", 		"context" => [ "Server" ] } 
				]
    },
    'auth_ldap' => {
                    summary   => 'Allows an LDAP directory to be used to store the database for HTTP Basic authentication',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 355,
                    directives=> [ { option =>"AuthLDAPAuthoritative", 		"context" => [ "Directory" ], "values" => [ "On", "Off" ] },
				   { option =>"AuthLDAPBindDN", 		"context" => [ "Directory" ] },
				   { option =>"AuthLDAPBindPassword", 		"context" => [ "Directory" ] },
				   { option =>"AuthLDAPCharsetConfig", 		"context" => [ "Server" ] },
				   { option =>"AuthLDAPCompareDNOnServer", 	"context" => [ "Directory" ], "values" => [ "On", "Off" ] },
 				   { option =>"AuthLDAPDereferenceAliases", 	"context" => [ "Directory" ], 
											"values" => [ "Never", "Searching", "Finding", "Always" ] }, 
				   { option =>"AuthLDAPEnabled", 		"context" => [ "Directory" ], "values" => [ "On", "Off" ] },
				   { option =>"AuthLDAPFrontPageHack", 		"context" => [ "Directory" ] },
				   { option =>"AuthLDAPGroupAttribute", 	"context" => [ "Directory" ] },
				   { option =>"AuthLDAPGroupAttributeIsDN", 	"context" => [ "Directory" ], "values" => [ "On", "Off" ] },
				   { option =>"AuthLDAPRemoteUserIsDN", 	"context" => [ "Directory" ], "values" => [ "On", "Off" ] },
				   { option =>"AuthLDAPUrl", 			"context" => [ "Directory" ] }
				]
    },
    'cache' => {
                    summary   => 'Content cache keyed to URIs',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 230,
                    directives=> [ { option =>"CacheDefaultExpire", 	"context" => [ "Server", "Virtual" ] },
				   { option =>"CacheDisable", 		"context" => [ "Server", "Virtual" ] },
                                   { option =>"CacheEnable", 		"context" => [ "Server", "Virtual" ] },
                                   { option =>"CacheForceCompletion", 	"context" => [ "Server", "Virtual" ] },
                                   { option =>"CacheIgnoreCacheControl","context" => [ "Server", "Virtual" ], "values" => [ "On", "Off" ] },
                                   { option =>"CacheIgnoreHeaders", 	"context" => [ "Server", "Virtual" ] },
                                   { option =>"CacheIgnoreNoLastMod", 	"context" => [ "Server", "Virtual" ], "values" => [ "On", "Off" ] },
                                   { option =>"CacheLastModifiedFactor","context" => [ "Server", "Virtual" ] },
                                   { option =>"CacheMaxExpire", 	"context" => [ "Server", "Virtual" ] }
                                ]
    },
    'charset_lite' => {
                    summary   => 'Specify character set translation or recoding',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 240,
                    directives=> [ { option =>"CharsetDefault", 	"context" => [ "Directory", "Server", "Virtual" ] },
                                   { option =>"CharsetOptions", 	"context" => [ "Directory", "Server", "Virtual" ] },
                                   { option =>"CharsetSourceEnc", 	"context" => [ "Directory", "Server", "Virtual" ] }
                                ]
    },
    'dav' => {
                    summary   => 'Distributed Authoring and Versioning (WebDAV) functionality',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 250,
                    module    => {
                                  Dav => 'mod_dav',
                                  DavDepthInfinity => 'mod_dav',
                                  DavMinTimeout => 'mod_dav'
                    },
                    directives=> [ { option =>"Dav", 			"context" => [ "Directory" ] },
				   { option =>"DavDepthInfinity", 	"context" => [ "Directory", "Server", "Virtual" ], "values" => [ "On", "Off" ] },
				   { option =>"DavMinTimeout", 		"context" => [ "Directory", "Server", "Virtual" ] }
                                ]
    },
    'dav_fs' => {
                    summary   => 'File system provider for mod_dav',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 260,
                    module    => {
                                  DavLockDB => 'mod_dav_fs'
                    },
                    directives=> [ { option =>"DavLockDB", "context" => [ "Server", "Virtual" ] }
                                ]
    },
    'deflate' => {
                    summary   => 'Compress content before it is delivered to the client',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 270,
                    module    => {
                                  DeflateBufferSize => 'mod_deflate',
                                  DeflateCompressionLevel => 'mod_deflate',
                                  DeflateFilterNote => 'mod_deflate',
                                  DeflateMemLevel => 'mod_deflate',
                                  DeflateWindowSize => 'mod_deflate'
                    },
                    directives=> [ { option =>"DeflateBufferSize", 		"context" => [ "Server", "Virtual" ] },
				   { option =>"DeflateCompressionLevel", 	"context" => [ "Server", "Virtual" ] },
				   { option =>"DeflateFilterNote", 		"context" => [ "Server", "Virtual" ] },
				   { option =>"DeflateMemLevel", 		"context" => [ "Server", "Virtual" ] },
				   { option =>"DeflateWindowSize", 		"context" => [ "Server", "Virtual" ] }
                                ]

    },
    'disk_cache' => {
                    summary   => 'Content cache storage manager keyed to URIs',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 280,
                    directives=> [ { option =>"CacheDirLength",		"context" => [ "Server", "Virtual" ] },
				   { option =>"CacheDirLevels",         "context" => [ "Server", "Virtual" ] },
                                   { option =>"CacheExpiryCheck",       "context" => [ "Server", "Virtual" ], "values" => [ "On", "Off" ] },
                                   { option =>"CacheGcClean",           "context" => [ "Server", "Virtual" ] },
                                   { option =>"CacheGcDaily",           "context" => [ "Server", "Virtual" ] },
                                   { option =>"CacheGcInterval",        "context" => [ "Server", "Virtual" ] },
                                   { option =>"CacheGcMemUsage",        "context" => [ "Server", "Virtual" ] },
                                   { option =>"CacheGcUnused",          "context" => [ "Server", "Virtual" ] },
                                   { option =>"CacheMaxFileSize",       "context" => [ "Server", "Virtual" ] },
                                   { option =>"CacheMinFileSize",       "context" => [ "Server", "Virtual" ] },
                                   { option =>"CacheRoot",              "context" => [ "Server", "Virtual" ] },
                                   { option =>"CacheSize",              "context" => [ "Server", "Virtual" ] },
                                   { option =>"CacheTimeMargin",        "context" => [ "Server", "Virtual" ] }
				]
    },
    'echo' => {
                    summary   => 'A simple echo server to illustrate protocol modules',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 290,
                    directives=> [ { option =>"ProtocolEcho", "context" => [ "Server", "Virtual" ], "values" => [ "On", "Off" ] }
				]
    },
    'ext_filter' => {
                    summary   => 'Pass the response body through an external program before delivery to the client',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 300,
                    module    => {
                                    ExtFilterDefine  => 'mod_ext_filter',
                                    ExtFilterOptions => 'mod_ext_filter',
                    },
                    directives=> [ { option =>"ExtFilterDefine", 	"context" => [ "Server" ] },
				   { option =>"ExtFilterOptions", 	"context" => [ "Directory" ] }
                                ]

    },
    'file_cache' => {
                    summary   => 'Caches a static list of files in memory',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 310,
                    directives=> [ { option =>"CacheFile",      "context" => [ "Server" ] },
                                   { option =>"MMapFile",	"context" => [ "Server" ] }
                                ]

    },
    'headers' => {
                    summary   => 'Customization of HTTP request and response headers',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 320,
                    module    => {
                                    Header => 'mod_headers',
                                    RequestHeader => 'mod_headers'
                    },
                    directives=> [ { option =>"Header",      	"context" => [ "Server", "Virtual", "Directory" ] },
                                   { option =>"RequestHeader",  "context" => [ "Server", "Virtual", "Directory" ] }
                                ]

    },
    'imap' => {
                    summary   => 'Server-side image map processing',
                    packages  => [],
                    default   => 1,
                    required  => 0,
                    suggested => 0,
                    position  => 330,
                    directives=> [ { option =>"ImapBase",       "context" => [ "Server", "Virtual", "Directory" ] },
                                   { option =>"ImapDefault",  	"context" => [ "Server", "Virtual", "Directory" ] },
                                   { option =>"ImapMenu",  	"context" => [ "Server", "Virtual", "Directory" ], 
									"values" => [ "none", "formatted", "semiformatted", "unformatted" ] }
                                ]

    },
    'info' => {
                    summary   => 'Provides a comprehensive overview of the server configuration',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 340,
                    module    => { AddModuleInfo => 'mod_info' },
                    directives=> [ { option =>"AddModuleInfo",         "context" => [ "Server", "Virtual" ] },
				]
    },
    'ldap' => {
                    summary   => 'LDAP connection pooling and result caching services for use by other LDAP modules',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 350,
                    directives=> [ { option =>"LDAPCacheEntries", 	"context" => [ "Server" ] },
				   { option =>"LDAPCacheTTL", 		"context" => [ "Server" ] },
                                   { option =>"LDAPConnectionTimeout", 	"context" => [ "Server" ] },
                                   { option =>"LDAPOpCacheEntries", 	"context" => [ "Server" ] },
                                   { option =>"LDAPOpCacheTTL", 	"context" => [ "Server" ] },
                                   { option =>"LDAPSharedCacheFile", 	"context" => [ "Server" ] },
                                   { option =>"LDAPSharedCacheSize", 	"context" => [ "Server" ] },
                                   { option =>"LDAPTrustedCA", 		"context" => [ "Server" ] },
                                   { option =>"LDAPTrustedCAType", 	"context" => [ "Server" ], 
							"values" => [ "DER_FILE", "BASE64_FILE", "CERT7_DB_PATH" ] }	
                                ]
    },
    'logio' => {
                    summary   => 'Logging of input and output bytes per request',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 360
    },
    'mem_cache' => {
                    summary   => 'Content cache keyed to URIs',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 370,
                    directives=> [ { option =>"MCacheMaxObjectCount",         "context" => [ "Server" ] },
				   { option =>"MCacheMaxObjectSize",          "context" => [ "Server" ] },
                                   { option =>"MCacheMaxStreamingBuffer",     "context" => [ "Server" ] },
                                   { option =>"MCacheMinObjectSize",          "context" => [ "Server" ] },
                                   { option =>"MCacheRemovalAlgorithm",       "context" => [ "Server" ], "values" => [ "LRU", "GDSF" ] },
                                   { option =>"MCacheSize",		      "context" => [ "Server" ] },
				]
    },
    'mime_magic' => {
                    summary   => 'Determines the MIME type of a file by looking at a few bytes of its contents',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 380,
                    module    => { MimeMagicFile => 'mod_mime_magic' },
                    directives=> [ { option =>"MimeMagicFile",         "context" => [ "Server", "Virtual" ] },
                                ]

    },
    'proxy' => {
                    summary   => 'HTTP/1.1 proxy/gateway server',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 390,
                    module    => { 
                                    NoProxy => 'mod_proxy',
                                    ProxyBadHeader => 'mod_proxy',
                                    ProxyBlock => 'mod_proxy',
                                    ProxyDomain => 'mod_proxy',
                                    ProxyErrorOverride => 'mod_proxy',
                                    ProxyIOBufferSize => 'mod_proxy',
                                    ProxyMaxForwards => 'mod_proxy',
                                    ProxyPass => 'mod_proxy',
                                    ProxyPassReverse => 'mod_proxy',
                                    ProxyPreserveHost => 'mod_proxy',
                                    ProxyReceiveBufferSize => 'mod_proxy',
                                    ProxyRemote => 'mod_proxy',
                                    ProxyRemoteMatch => 'mod_proxy',
                                    ProxyRequests => 'mod_proxy',
                                    ProxyTimeout => 'mod_proxy',
                                    ProxyVia => 'mod_proxy'
                    },
                    directives=> [ { option =>"AllowCONNECT",         	"context" => [ "Server", "Virtual" ] },
				   { option =>"NoProxy",         	"context" => [ "Server", "Virtual" ] },
                                   { option =>"ProxyBadHeader",         "context" => [ "Server", "Virtual" ], 
										"values" => [ "IsError", "Ignore", "StartBody" ] },
                                   { option =>"ProxyBlock",  	        "context" => [ "Server", "Virtual" ] },
                                   { option =>"ProxyDomain",	        "context" => [ "Server", "Virtual" ] },
                                   { option =>"ProxyErrorOverride",     "context" => [ "Server", "Virtual" ], "values" => [ "On", "Off" ] },
                                   { option =>"ProxyIOBufferSize",      "context" => [ "Server", "Virtual" ] },
                                   { option =>"ProxyMaxForwards",       "context" => [ "Server", "Virtual" ] },
                                   { option =>"ProxyPass",	        "context" => [ "Server", "Virtual", "Directory" ] },
                                   { option =>"ProxyPassReverse",       "context" => [ "Server", "Virtual", "Directory" ] },
                                   { option =>"ProxyPreserveHost",      "context" => [ "Server", "Virtual" ], "values" => [ "On", "Off" ] },
                                   { option =>"ProxyReceiveBufferSize", "context" => [ "Server", "Virtual" ] },
                                   { option =>"ProxyRemote",	        "context" => [ "Server", "Virtual" ] },
                                   { option =>"ProxyRemoteMatch",       "context" => [ "Server", "Virtual" ] },
                                   { option =>"ProxyRequests",          "context" => [ "Server", "Virtual" ], "values" => [ "On", "Off" ] },
                                   { option =>"ProxyTimeout",	        "context" => [ "Server", "Virtual" ] },
                                   { option =>"ProxyVia",         	"context" => [ "Server", "Virtual" ], 
												"values" => [ "On", "Off", "Full", "Block" ] }
                                ]

    },
    'proxy_connect' => {
                    summary   => 'mod_proxy extension for CONNECT request handling',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 400,
                    module    => { AllowCONNECT => 'mod_proxy_connect' }
    },
    'proxy_ftp' => {
                    summary   => 'FTP support module for mod_proxy',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 410
    },
    'proxy_http' => {
                    summary   => 'HTTP support module for mod_proxy',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 420
    },
    'rewrite' => {
                    summary   => 'Provides a rule-based rewriting engine to rewrite requested URLs on the fly',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 430,
                    module    => {
                                    RewriteBase => 'mod_rewrite',
                                    RewriteCond => 'mod_rewrite',
                                    RewriteEngine => 'mod_rewrite',
                                    RewriteLock => 'mod_rewrite',
                                    RewriteLog => 'mod_rewrite',
                                    RewriteLogLevel => 'mod_rewrite',
                                    RewriteMap => 'mod_rewrite',
                                    RewriteOptions => 'mod_rewrite',
                                    RewriteRule => 'mod_rewrite'
                    },
                    directives=> [ { option =>"RewriteBase",         "context" => [ "Directory" ] },
				   { option =>"RewriteCond",         "context" => [ "Server", "Virtual", "Directory" ] },
                                   { option =>"RewriteEngine",       "context" => [ "Server", "Virtual", "Directory" ], "values" => [ "On", "Off" ] },
                                   { option =>"RewriteLock",         "context" => [ "Server" ] },
                                   { option =>"RewriteLog",          "context" => [ "Server", "Virtual" ] },
                                   { option =>"RewriteLogLevel",     "context" => [ "Server", "Virtual" ] },
                                   { option =>"RewriteMap",          "context" => [ "Server", "Virtual" ] },
                                   { option =>"RewriteOptions",      "context" => [ "Server", "Virtual", "Directory" ] },
                                   { option =>"RewriteRule",         "context" => [ "Server", "Virtual", "Directory" ] }
                                ]

    },
    'speling' => {
                    summary   => 'Attempts to correct mistaken URLs that users might have entered',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 440,
                    module    => { CheckSpelling => 'mod_speling' },
                    directives=> [ { option =>"CheckSpelling",         "context" => [ "Server", "Virtual", "Directory" ], "values" => [ "On", "Off" ] },
                                ]

    },
    'ssl' => {
                    summary   => 'Strong cryptography using the Secure Sockets Layer (SSL) and Transport Layer Security (TLS) protocols',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 450,
                    directives=> [ { option =>"SSLCACertificateFile", 		"context" => [ "SSL", "Server", "Virtual" ] },
				   { option =>"SSLCACertificatePath", 		"context" => [ "SSL", "Server", "Virtual" ] },
                                   { option =>"SSLCARevocationFile", 		"context" => [ "SSL", "Server", "Virtual" ] },
                                   { option =>"SSLCARevocationPath", 		"context" => [ "SSL", "Server", "Virtual" ] }, 
                                   { option =>"SSLCertificateChainFile", 	"context" => [ "SSL", "Server", "Virtual" ] },
                                   { option =>"SSLCertificateFile", 		"context" => [ "SSL", "Server", "Virtual" ] },
                                   { option =>"SSLCertificateKeyFile", 		"context" => [ "SSL", "Server", "Virtual" ] },
                                   { option =>"SSLCipherSuite", 		"context" => [ "SSL", "Server", "Virtual", "Directory" ] },
                                   { option =>"SSLEngine", 			"context" => [ "SSL", "Server", "Virtual" ], "values" => [ "On", "Off" ] },
                                   { option =>"SSLMutex", 			"context" => [ "SSL", "Server" ] },
                                   { option =>"SSLOptions", 			"context" => [ "SSL", "Server", "Virtual", "Directory" ] },
                                   { option =>"SSLPassPhraseDialog", 		"context" => [ "SSL", "Server" ] },
                                   { option =>"SSLProtocol", 			"context" => [ "SSL", "Server", "Virtual" ] },
                                   { option =>"SSLProxyCACertificateFile", 	"context" => [ "SSL", "Server", "Virtual" ] },
                                   { option =>"SSLProxyCACertificatePath", 	"context" => [ "SSL", "Server", "Virtual" ] },
                                   { option =>"SSLProxyCARevocationFile",  	"context" => [ "SSL", "Server", "Virtual" ] },
                                   { option =>"SSLProxyCARevocationPath",  	"context" => [ "SSL", "Server", "Virtual" ] },
                                   { option =>"SSLProxyCipherSuite", 		"context" => [ "SSL", "Server", "Virtual", "Directory" ] },
                                   { option =>"SSLProxyEngine", 		"context" => [ "SSL", "Server", "Virtual" ], "values" => [ "On", "Off" ] },
                                   { option =>"SSLProxyMachineCertificateFile", "context" => [ "SSL", "Server" ] },
                                   { option =>"SSLProxyMachineCertificatePath", "context" => [ "SSL", "Server" ] },
                                   { option =>"SSLProxyProtocol", 		"context" => [ "SSL", "Server", "Virtual" ] },
                                   { option =>"SSLProxyVerify", 		"context" => [ "SSL", "Server", "Virtual", "Directory" ], 
											"values" => [ "none", "optional", "require", "optional_no_ca" ] },
                                   { option =>"SSLProxyVerifyDepth", 		"context" => [ "SSL", "Server", "Virtual", "Directory" ] },
                                   { option =>"SSLRandomSeed", 			"context" => [ "SSL", "Server" ] },
                                   { option =>"SSLRequire", 			"context" => [ "SSL", "Directory" ] },
                                   { option =>"SSLRequireSSL", 			"context" => [ "SSL", "Directory" ] },
                                   { option =>"SSLSessionCache", 		"context" => [ "SSL", "Server" ] },
                                   { option =>"SSLSessionCacheTimeout", 	"context" => [ "SSL", "Server", "Virtual" ] },
                                   { option =>"SSLVerifyClient", 		"context" => [ "SSL", "Server", "Virtual", "Directory" ],
											"values" => [ "none", "optional", "require", "optional_no_ca" ] },
                                   { option =>"SSLVerifyDepth", 		"context" => [ "SSL", "Server", "Virtual", "Directory" ] }
                                ]
    },
    'unique_id' => {
                    summary   => 'Provides an environment variable with a unique identifier for each request',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 460
    },
    'usertrack' => {
                    summary   => 'Clickstream logging of user activity on a site',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 470,
                    module    => {
                                  CookieDomain => 'mod_usertrack',
                                  CookieExpires => 'mod_usertrack',
                                  CookieName => 'mod_usertrack',
                                  CookieStyle => 'mod_usertrack',
                                  CookieTracking => 'mod_usertrack'
                    },
                    directives=> [ { option =>"CookieDomain", 	"context" => [ "Server", "Virtual", "Directory" ] },
                                   { option =>"CookieExpires",  "context" => [ "Server", "Virtual", "Directory" ] },
                                   { option =>"CookieName",     "context" => [ "Server", "Virtual", "Directory" ] },
                                   { option =>"CookieStyle",    "context" => [ "Server", "Virtual", "Directory" ], 
								"values" => [ "Netscape", "Cookie", "Cookie2", "RFC2109", "RFC2965" ] },
                                   { option =>"CookieTracking", "context" => [ "Server", "Virtual", "Directory" ], , "values" => [ "On", "Off" ] },
				]
    },
    'vhost_alias' => {
                    summary   => 'Provides support for dynamically configured mass virtual hosting',
                    packages  => [],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 480,
                    module    => {
                                    VirtualDocumentRoot => 'mod_vhost_alias',
                                    VirtualDocumentRootIP => 'mod_vhost_alias',
                                    VirtualScriptAlias => 'mod_vhost_alias',
                                    VirtualScriptAliasIP => 'mod_vhost_alias'
                    }
    },
    'php4' => {
                    summary   => 'Provides support for PHP4 dynamically generated pages',
                    packages  => ["apache2-mod_php4"],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 490
    },
    'php5' => {
                    summary   => 'Provides support for PHP5 dynamically generated pages',
                    packages  => ["apache2-mod_php5"],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 490
    },
    'perl' => {
                    summary   => 'Provides support for Perl dynamically generated pages',
                    packages  => ["apache2-mod_perl"],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 500
    },
    'python' => {
                    summary   => 'Provides support for Python dynamically generated pages',
                    packages  => ["apache2-mod_python"],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 510
    },
    'ruby' => {
                    summary   => 'Provides support for Ruby dynamically generated pages',
                    packages  => ["apache2-mod_ruby"],
                    default   => 0,
                    required  => 0,
                    suggested => 0,
                    position  => 520
    }
);


%selection = (
    TestSel => {
                summary => 'A test selection',
                modules => [ "m1", "m2", "m3" ],
                default => 0
    }
);

