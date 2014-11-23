# == Class: dokuwiki::install
#
# See the README.md for documentation
#
class dokuwiki::install (
    $version           = $dokuwiki::version,
    $package_category  = $dokuwiki::package_category,
    $package_name      = $dokuwiki::package_name,
    $use_webapp_config = $dokuwiki::use_webapp_config,
    $vhost             = $dokuwiki::vhost,
    $install_dir       = $dokuwiki::install_dir,
    $base_path         = $dokuwiki::base_path,
) {

    package {
        'www-apps/dokuwiki':
            ensure   => $version,
            category => $package_category,
            name     => $package_name;
    }

    if $use_webapp_config {
        webapp_config {
            "dokuwiki-${version}":
                action     => 'install',
                vhost      => $vhost,
                installdir => $install_dir,
                base       => $base_path,
                app        => 'dokuwiki',
                version    => $version,
                depends    => Package['www-apps/dokuwiki'];
        }
    }

}

