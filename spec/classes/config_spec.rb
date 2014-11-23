require 'spec_helper'
describe 'dokuwiki::config' do

    context 'with defaults for all parameters' do
        let(:params) {{
            :manage_vhost            => true,
            :vhost                   => 'dokuwiki.example.com',
            :base_path               => 'dokuwiki',
            :apache_confdir          => '/etc/apache2/vhosts.d',
            :install_dir             => '/var/www/localhost/htdocs',
            :local_conf_template     => 'dokuwiki/local.php.erb',
            :protected_conf_template => 'dokuwiki/local.protected.php.erb',
            :ldap_servers            => ['ldap'],
        }}

        it { should contain_file('/var/www/localhost/htdocs/dokuwiki/conf/local.php') }
        it {
            should contain_file('/var/www/localhost/htdocs/dokuwiki/conf/local.protected.php')
                .with_content(/Managed by puppet/)
        }
    end
end

