require 'spec_helper'

describe Styleguide::FileLocator do

  describe 'get' do
    it 'should return a module when requesting a module' do
      Styleguide::FileLocator.get('_some_module.haml', 'module').should be_instance_of Styleguide::Module
    end

    it 'should return a pattern when requesting a pattern' do
      Styleguide::FileLocator.get('_some_module.haml', 'pattern').should be_instance_of Styleguide::Pattern
    end
  end

  describe 'modules' do

    before do
      Dir.stub(:glob).and_return(['some.file'])
    end

    it 'should get all the files in the modules directory' do
      Dir.should_receive(:glob).with(File.join(Styleguide::Modules.directory, '**', '*.{haml,erb}'))
      Styleguide::FileLocator.modules
    end

    it 'should return a module for each file' do
      modules = Styleguide::FileLocator.modules
      modules.length.should == 1
      modules.each do |m|
        m.should be_instance_of Styleguide::Module
      end
    end
  end

  describe 'patterns' do

    before do
      Dir.stub(:glob).and_return(['some.file'])
    end

    it 'should get all the files in the patterns directory' do
      Dir.should_receive(:glob).with(File.join(Styleguide::Patterns.directory, '**', '*.{haml,erb}'))
      Styleguide::FileLocator.patterns
    end

    it 'should return a pattern for each file' do
      patterns = Styleguide::FileLocator.patterns
      patterns.length.should == 1
      patterns.each do |p|
        p.should be_instance_of Styleguide::Pattern
      end
    end
  end
end
