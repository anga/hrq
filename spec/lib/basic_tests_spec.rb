require 'spec_helper'

RSpec.describe 'Basic usages' do
  context 'configuration' do
    it 'should allow you to add configuration files' do
      Hrq.add_template File.join(Dir.pwd, '..', 'templates', 'basic.rb')
    end
  end
end