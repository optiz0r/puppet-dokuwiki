require 'spec_helper'
describe 'dokuwiki::install' do

    context 'with defaults for all parameters' do
        it { should contain_package('www-apps/dokuwiki') }
    end

    context 'on Gentoo' do
        let(:params) {{
            :use_webapp_config => true,
            :version           => '123'
        }}

        it { should contain_webapp_config('dokuwiki-123') }
    end
end

