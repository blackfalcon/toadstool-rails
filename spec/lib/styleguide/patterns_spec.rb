require 'spec_helper'

describe Styleguide::Patterns do

  describe 'directory' do

    it 'should return all files in the module directory' do
      Styleguide::Patterns.directory.should == Pathname.new(File.join(Rails.root, 'app', 'views', 'admin', 'styleguide', 'ui_patterns'))
    end

    it 'should return the correct sass directory' do
      Styleguide::Patterns.sass_directory.should == Pathname.new(File.join(Rails.root, 'app', 'assets', 'stylesheets', 'ui_patterns'))
    end
  end
end
