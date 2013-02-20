require 'spec_helper'

describe Admin::Styleguide::ExamplesController do

  describe 'show' do

    before do
      controller.stub(:require_admin).and_return(true)
    end

    context 'when requesting a pattern example' do

      let (:format) { 'pattern' }
      let (:pattern) { Styleguide::Pattern.new('') }

      it 'should assign the correct example' do
        Styleguide::FileLocator.should_receive(:get).with('_example.html.haml', 'pattern').and_return(pattern)
        get :show, :format => format, :example => '_example.html.haml'
        assigns(:example).should == pattern
      end

      it 'should not contain any partial data' do
        Styleguide::Fixtures.stub(:get).and_return('something')
        get :show, :format => format, :example => '_example.html.haml'
        assigns(:data).should be_nil
      end
    end

    context 'when requesting a module example' do

      let (:format) { 'module' }
      let (:my_module) { Styleguide::Module.new('') }
      let (:partial_data) { 'some hash of values' }

      it 'should assign the correct example' do
        Styleguide::FileLocator.should_receive(:get).with('_example.html.haml', 'module').and_return(my_module)
        get :show, :format => format, :example => '_example.html.haml'
        assigns(:example).should == my_module
      end

      it 'should assign partial data based on requested module' do
        Styleguide::Fixtures.should_receive(:get).with('_example.html.haml').and_return(partial_data)
        get :show, :format => format, :example => '_example.html.haml'
        assigns(:data).should == partial_data
      end
    end
  end
end
