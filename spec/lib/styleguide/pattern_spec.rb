require 'spec_helper'
require 'lib/styleguide/shared_examples_for_styleguide_example'

describe Styleguide::Pattern do

  include StyleguideSpecHelper

  let(:simple) { Styleguide::Pattern.new(relative_to_full_pattern_path('_whatever.html.haml')) }
  let(:nested) { Styleguide::Pattern.new(relative_to_full_pattern_path('nested/_whatever.html.haml')) }
  let(:crazy) { Styleguide::Pattern.new(relative_to_full_pattern_path('_whatever-test_1.html.haml')) }

  it_should_behave_like :styleguide_example_file, Styleguide::Patterns.sass_directory, Styleguide::Patterns.directory

  describe 'partial' do
    it 'should provide the path to the partial relative to the views folder' do
      simple.partial.should == 'admin/styleguide/ui_patterns/whatever'
    end

    it 'should provide the correct path to the partial for nested modules' do
      nested.partial.should == 'admin/styleguide/ui_patterns/nested/whatever'
    end
  end

  describe 'slug' do
    it 'should append the correct type to the file name' do
      simple.slug.should == '_whatever.html.haml.pattern'
    end

    it 'should apply the correct slug to a nested file' do
      nested.slug.should == 'nested/_whatever.html.haml.pattern'
    end
  end
end
