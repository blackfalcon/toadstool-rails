require 'spec_helper'

describe Styleguide::PatternsPresenter do

  include StyleguideSpecHelper

  let(:presenter) { Styleguide::PatternsPresenter.new(files) }

  let(:in_root) { styleguide_pattern_from_relative_path('_in_root.haml') }
  let(:nested) { styleguide_pattern_from_relative_path('nested', '_nested.haml') }
  let(:another_nested) { styleguide_pattern_from_relative_path('another_nested', '_other_nested.haml') }
  let(:another_nested_in_same_directory) { styleguide_pattern_from_relative_path('another_nested', '_another_nested.haml') }
  let(:extremely_nested) { styleguide_pattern_from_relative_path('nested', 'and_again', '_nested_nested.haml') }

  context 'all files live in root directory' do

    let(:files) { [ in_root ] }
    let(:root_category) { presenter.categories.first }

    it 'should only contain the root category' do
      presenter.categories.length.should == 1
    end

    it 'should include all the files in the category' do
      root_category.files.should == files
    end

    it 'should include the correct name for the root directory' do
      root_category.display_name.should == 'Misc'
    end
  end

  context 'files exist in nested directories' do
    let(:files) { [ in_root, nested, another_nested, another_nested_in_same_directory ] }

    it 'should contain the correct number of categories' do
      presenter.categories.length.should == 3
    end

    it 'should always have misc files first' do
      presenter.categories[0].display_name.should == 'Misc'
    end

    it 'should order all other categories alphabetically' do
      presenter.categories[1].display_name.should == 'Another nested'
      presenter.categories[2].display_name.should == 'Nested'
    end

    it 'should include the correct files for each category listed alphabetically' do
      presenter.categories[0].files.should == [ in_root ]
      presenter.categories[1].files.should == [ another_nested_in_same_directory, another_nested ]
      presenter.categories[2].files.should == [ nested ]
    end
  end

  context 'files exist in deeply nested directories' do

    let(:files) { [ extremely_nested ] }

    it 'should name a nested  correctly' do
      presenter.categories.first.display_name.should == 'Nested - And again'
    end
  end

  context 'when no files exist' do
    let(:files) { [] }

    it 'should not include any categories' do
      presenter.categories.should == []
    end
  end
end
