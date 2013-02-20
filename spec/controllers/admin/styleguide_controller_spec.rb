require 'spec_helper'

describe Admin::StyleguideController do

  include StyleguideSpecHelper

  describe 'modules' do

    let(:my_module) { Styleguide::Module.new(relative_to_full_module_path('_whatever.haml')) }
    let(:modules) { [my_module] }

    before do
      Styleguide::FileLocator.stub(:modules).and_return(modules)
    end

    it 'should retrieve all modules and return the name for each module' do
      get :modules
      assigns(:presenter).should be_instance_of Styleguide::ModulesPresenter
    end

    it 'should create the presenter with correct modules' do
      Styleguide::ModulesPresenter.should_receive(:new).with(modules)
      get :modules
    end
  end

  describe 'patterns' do
    let(:my_pattern) { Styleguide::Pattern.new(relative_to_full_pattern_path('_whatever.haml')) }
    let(:patterns) { [my_pattern] }

    before do
      Styleguide::FileLocator.stub(:patterns).and_return(patterns)
    end

    it 'should retrieve all modules and return the name for each module' do
      get :patterns
      assigns(:presenter).should be_instance_of Styleguide::PatternsPresenter
    end

    it 'should create the presenter with correct modules' do
      Styleguide::PatternsPresenter.should_receive(:new).with(patterns)
      get :patterns
    end
  end
end
