require 'spec_helper'

RSpec.describe 'Basic usages' do
  context 'configuration' do
    it 'should allow you to add configuration files' do
      Hrq.add_template File.join(Dir.pwd, '..', 'templates', 'basic.rb')
    end

    it 'should allows to clean all the templates configurations' do
      Hrq.clean_templates
    end

    context 'using basic configuration' do
      before do
        Hrq.add_template File.join(Dir.pwd, '..', 'templates', 'basic.rb')
      end

      it 'should allows to translate a basic query'
    end
  end
end