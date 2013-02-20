require 'spec_helper'

describe Styleguide::Modules do

  describe 'directory' do
    it 'should return the correct directory' do
      Styleguide::Modules.directory.should == Pathname.new(File.join(Rails.root, 'app', 'views', 'application', 'modules'))
    end
    it 'should return the correct sass directory' do
      Styleguide::Modules.sass_directory.should == Pathname.new(File.join(Rails.root, 'app', 'assets', 'stylesheets', 'modules'))
    end
  end
end
