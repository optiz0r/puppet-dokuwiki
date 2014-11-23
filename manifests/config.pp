# == Class: dokuwiki::config
#
# See the README.md for documentation
#
class dokuwiki::config (
    $manage_vhost            = $dokuwiki::manage_vhost,
    $vhost                   = $dokuwiki::vhost,
    $base_path               = $dokuwiki::base_path,
    $apache_confdir          = $dokuwiki::apache_confdir,
    $apache_user             = $dokuwiki::apache_user,
    $apache_group            = $dokuwiki::apache_group,
    $install_dir             = $dokuwiki::install_dir,
    $data_dir                = $dokuwiki::data_dir,
    $local_conf_template     = $dokuwiki::local_conf_template,
    $protected_conf_template = $dokuwiki::protected_conf_template,
    $wiki_title              = $dokuwiki::wiki_title,
    $userewrite              = $dokuwiki::userewrite,
    $use_acl                 = $dokuwiki::use_acl,
    $breadcrumbs             = $dokuwiki::breadcrumbs,
    $youarehere              = $dokuwiki::youarehere,
    $updatecheck             = $dokuwiki::updatecheck,
    $content_license         = $dokuwiki::content_license,
    $locktime                = $dokuwiki::locktime,
    $auth_type               = $dokuwiki::auth_type,
    $ldap_version            = $dokuwiki::ldap_version,
    $ldap_servers            = $dokuwiki::ldap_servers,
    $ldap_user_tree          = $dokuwiki::ldap_user_tree,
    $ldap_user_filter        = $dokuwiki::ldap_user_filter,
    $ldap_user_scope         = $dokuwiki::ldap_user_scope,
    $ldap_user_account_attr  = $dokuwiki::ldap_user_account_attr,
    $ldap_group_tree         = $dokuwiki::ldap_group_tree,
    $ldap_group_filter       = $dokuwiki::ldap_group_filter,
    $ldap_group_scope        = $dokuwiki::ldap_group_scope,
    $ldap_starttls           = $dokuwiki::ldap_starttls,
    $ldap_use_sso            = $dokuwiki::ldap_use_sso,
    $ldap_recursive_search   = $dokuwiki::ldap_recursive_search,
    $ldap_binddn             = $dokuwiki::ldap_binddn,
    $ldap_bindpw             = $dokuwiki::ldap_bindpw,
    $use_referrals           = $dokuwiki::use_referrals,
    $ldap_mapping_name       = $dokuwiki::ldap_mapping_name,
    $ldap_mapping_groups     = $dokuwiki::ldap_mapping_groups,
    $manager                 = $dokuwiki::manager,
    $superuser               = $dokuwiki::superuser,
) {

    file {
        "${install_dir}/htdocs/${base_path}conf/local.php":
            content => template($local_conf_template),
            owner   => 'root',
            group   => 'root',
            mode    => '0444',
            replace => false;

        "${install_dir}/htdocs/${base_path}conf/local.protected.php":
            content => template($protected_conf_template),
            owner   => 'root',
            group   => 'root',
            mode    => '0444';

        $data_dir:
            ensure => directory,
            owner  => $apache_user,
            group  => $apache_group,
            mode   => '0664';
    }

    if $manage_vhost {
        file {
            "${apache_confdir}/${vhost}.conf":
                content => template('dokuwiki/vhost.conf.erb'),
                owner   => 'root',
                group   => 'root',
                mode    => '0444';
        }
    }

}

