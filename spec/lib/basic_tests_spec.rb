require 'spec_helper'
PATH = File.expand_path File.dirname(__FILE__)
BASIC_TEMPLATE = File.join(PATH, '..', 'templates', 'basic.rb')

RSpec.describe 'Basic usages' do

  context 'configuration' do
    before do
      Hrq.clean_matches
    end
    it 'should allow you to add configuration files' do
      Hrq.add_template File.join(PATH, '..', 'templates', 'basic.rb')
    end

    context 'using basic configuration' do
      before do
        Hrq.add_template BASIC_TEMPLATE
      end

      it 'should allows to translate a basic query' do
        pending 'We need to do many things before...'
        expect(Hrq.translate('I want all users')).to eq('SELECT users.* FROM users;')
      end
    end
  end

  context 'Hrq' do
    it 'should allow to evaluate manually a match' do
      expect(Hrq.methods.include?(:match)).to eq(true)
    end

    it 'match method should call Hrq::Context.match' do
      expect_any_instance_of(Hrq::Context).to receive(:match).at_least(:once)
      Hrq.match /.*/ do
        # Dummy
      end
    end

    it 'match method, should add a new match to the db' do
      Hrq.add_template BASIC_TEMPLATE
      expect(Hrq::Db.matches.size == 1)
    end

    it 'should allows to clean all the templates configurations' do
      expect(Hrq.methods.include?(:clean_templates)).to eq(true)
    end

    it 'clean_templates should call to Hrq::Db.clear' do
      expect(Hrq::Db).to receive(:clear)
      Hrq.clean_matches
    end
  end

  context 'Hrq::Context' do
    before do
      Hrq.clean_templates
    end

    it 'Hrq.add_template should call to Hrq::Context.load_template' do
      expect(Hrq::Context).to receive(:load_template)
      Hrq.add_template BASIC_TEMPLATE
    end

    it 'load_template should create a new instance of Hrq::Context' do
      expect_any_instance_of(Hrq::Context).to receive(:match).at_least(:once)
      Hrq.add_template BASIC_TEMPLATE
    end

    it 'match should call to Hrq::Db.add_match' do
      expect(Hrq::Db).to receive(:add_match).at_least(:once)
      Hrq.add_template BASIC_TEMPLATE
    end
  end

  context 'Hrq::Db' do

    it 'add_match should generate a new Hrq::Match object' do
      expect(Hrq::Match).to receive(:new)
      Hrq::Db.add_match // do
        # Dummy
      end
    end

    it 'matches should return all matches'do
      Hrq.clean_matches
      Hrq::Db.add_match // do
        # Dummy
      end
      expect(Hrq::Db.matches).to be_kind_of(Array)
      expect(Hrq::Db.matches[0]).to be_kind_of(Hrq::Match)
    end

    it 'clear should reset matches', focus: true do
      Hrq.clean_matches
      Hrq::Db.add_match // do
        # Dummy
      end
      Hrq::Db.clear
      expect(Hrq::Db.matches).to eq([])
    end
  end
end