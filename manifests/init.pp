# == Class: dokuwiki
#
# See the README.md for documentation
#
class dokuwiki (
    $version                 = $dokuwiki::params::version,
    $package_category        = $dokuwiki::params::package_category,
    $package_name            = $dokuwiki::params::package_name,
    $use_webapp_config       = $dokuwiki::params::use_webapp_config,
    $manage_vhost            = $dokuwiki::params::manage_vhost,
    $vhost                   = $dokuwiki::params::vhost,
    $base_path               = $dokuwiki::params::base_path,
    $apache_confdir          = $dokuwiki::params::apache_confdir,
    $apache_user             = $dokuwiki::params::apache_user,
    $apache_group            = $dokuwiki::params::apache_group,
    $vhost_conf_template     = $dokuwiki::params::vhost_conf_template,
    $install_dir             = $dokuwiki::params::install_dir,
    $data_dir                = $dokuwiki::params::data_dir,
    $local_conf_template     = $dokuwiki::params::local_conf_template,
    $protected_conf_template = $dokuwiki::params::protected_conf_template,
    $wiki_title              = $dokuwiki::params::wiki_title,
    $use_rewrite             = $dokuwiki::params::use_rewrite,
    $use_acl                 = $dokuwiki::params::use_acl,
    $breadcrumbs             = $dokuwiki::params::breadcrumbs,
    $youarehere              = $dokuwiki::params::youarehere,
    $updatecheck             = $dokuwiki::params::updatecheck,
    $content_license         = $dokuwiki::params::content_license,
    $locktime                = $dokuwiki::params::locktime,
    $auth_type               = $dokuwiki::params::auth_type,
    $ldap_version            = $dokuwiki::params::ldap_version,
    $ldap_servers            = $dokuwiki::params::ldap_servers,
    $ldap_user_tree          = $dokuwiki::params::ldap_user_tree,
    $ldap_user_filter        = $dokuwiki::params::ldap_user_filter,
    $ldap_user_scope         = $dokuwiki::params::ldap_user_scope,
    $ldap_user_account_attr  = $dokuwiki::params::ldap_user_account_attr,
    $ldap_group_tree         = $dokuwiki::params::ldap_group_tree,
    $ldap_group_filter       = $dokuwiki::params::ldap_group_filter,
    $ldap_group_scope        = $dokuwiki::params::ldap_group_scope,
    $ldap_starttls           = $dokuwiki::params::ldap_starttls,
    $ldap_use_sso            = $dokuwiki::params::ldap_use_sso,
    $ldap_recursive_search   = $dokuwiki::params::ldap_recursive_search,
    $ldap_binddn             = $dokuwiki::params::ldap_binddn,
    $ldap_bindpw             = $dokuwiki::params::ldap_bindpw,
    $use_referrals           = $dokuwiki::params::use_referrals,
    $ldap_mapping_name       = $dokuwiki::params::ldap_mapping_name,
    $ldap_mapping_groups     = $dokuwiki::params::ldap_mapping_groups,
    $manager                 = $dokuwiki::params::manager,
    $superuser               = $dokuwiki::params::superuser,
) inherits dokuwiki::params {

    # Allow a big-endian date format with optional letter suffix
    validate_re($version, '^\d{8}[a-z]?$')
    validate_string($package_category)
    validate_string($package_name)
    validate_bool($use_webapp_config)
    validate_bool($manage_vhost)
    validate_string($vhost)
    validate_string($base_path)
    validate_string($apache_confdir)
    validate_string($vhost_conf_template)
    validate_absolute_path($install_dir)
    validate_absolute_path($data_dir)
    validate_string($local_conf_template)
    validate_string($protected_conf_template)

    include '::dokuwiki::install'
    include '::dokuwiki::config'

    # Anchor this as per #8040 - this ensures that classes won't float off and
    # mess everything up.  You can read about this at:
    # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
    anchor {
        'dokuwiki::begin': ;
        'dokuwiki::end': ;
    }

    Anchor['dokuwiki::begin']
        -> Class['::dokuwiki::install']
        -> Class['::dokuwiki::config']
        -> Anchor['dokuwiki::end']

}
