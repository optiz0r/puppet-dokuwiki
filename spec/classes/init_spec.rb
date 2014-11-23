require 'spec_helper'
describe 'dokuwiki' do

    context 'on unsupported distributions' do
        let(:facts) {{
            :osfamily => 'Unsupported',
        }}

        it 'we fail' do
            expect { subject }.to raise_error(/not supported on an Unsupported/)
        end
    end

    context 'with defaults for all parameters' do
        let(:facts) {{
            :osfamily => 'Gentoo',
        }}

        it { should contain_class('dokuwiki') }
        it { should contain_class('dokuwiki::install') }
        it { should contain_class('dokuwiki::config') }
    end
end
