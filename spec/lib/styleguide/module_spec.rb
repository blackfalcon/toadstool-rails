require 'spec_helper'
require 'lib/styleguide/shared_examples_for_styleguide_example'

describe Styleguide::Module do

  include StyleguideSpecHelper

  let(:simple) { Styleguide::Module.new(relative_to_full_module_path('_whatever.html.haml')) }
  let(:nested) { Styleguide::Module.new(relative_to_full_module_path('nested/_whatever.html.haml')) }
  let(:crazy) { Styleguide::Module.new(relative_to_full_module_path('_whatever-test_1.html.haml')) }

  it_should_behave_like :styleguide_example_file, Styleguide::Modules.sass_directory, Styleguide::Modules.directory

  describe 'partial' do
    it 'should provide the path to the partial relative to the views folder' do
      simple.partial.should == 'application/modules/whatever'
    end

    it 'should provide the correct path to the partial for nested modules' do
      nested.partial.should == 'application/modules/nested/whatever'
    end
  end

  describe 'slug' do
    it 'should append the correct type to the file name' do
      simple.slug.should == '_whatever.html.haml.module'
    end

    it 'should apply the correct slug to a nested file' do
      nested.slug.should == 'nested/_whatever.html.haml.module'
    end
  end
end
