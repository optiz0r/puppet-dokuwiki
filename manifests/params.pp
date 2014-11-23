# == Class: dokuwiki::params
#
# See the README.md for documentation
#
class dokuwiki::params {

    case $::osfamily {
        'Gentoo': {
            $package_category  = 'www-apps'
            $package_name      = 'dokuwiki'
            $version           = '20140929a'
            $use_webapp_config = true
            $apache_confdir    = '/etc/apache/vhosts.d'
            $apache_user       = 'apache'
            $apache_group      = 'apache'
        }

        default: {
            fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
        }
    }

    $manage_vhost            = true
    $vhost                   = 'dokuwiki.example.com'
    $base_path               = 'dokuwiki'
    $install_dir             = '/var/www/localhost/htdocs'
    $data_dir                = '/var/www/localhost/htdocs/data'
    $vhost_conf_template     = 'dokuwiki/vhost.conf.erb'
    $local_conf_template     = 'dokuwiki/local.php.erb'
    $protected_conf_template = 'dokuwiki/local.protected.php.erb'

    # Configuration directives
    $wiki_title             = 'dokuwiki'
    $userewrite             = true
    $use_acl                = true
    $breadcrumbs            = false
    $youarehere             = true
    $updatecheck            = false
    $content_license        = 'CC-BY-SA'
    $locktime               = 30*60
    $auth_type              = 'ldap'
    $ldap_version           = 3
    $ldap_servers           = ['ldap']
    $ldap_user_tree         = 'ou=People,dc=local'
    $ldap_user_filter       = '(&(uid=%{user})(objectClass=posixAccount))'
    $ldap_user_scope        = 'sub'
    $ldap_user_account_attr = 'uid'
    $ldap_group_tree        = 'ou=Group,dc=local'
    $ldap_group_filter      = '(&(objectClass=posixGroup)(|(gidNumber=%{gid})(memberUid=%{user})))'
    $ldap_group_scope       = 'sub'
    $ldap_starttls          = true
    $ldap_use_sso           = true
    $ldap_recursive_search  = true
    $ldap_binddn            = 'cn=admin,dc=local'
    $ldap_bindpw            = 'changeme'
    $use_referrals          = true
    $ldap_mapping_name      = 'name'
    $ldap_mapping_groups    = []
    
}

