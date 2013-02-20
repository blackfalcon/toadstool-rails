shared_examples_for :styleguide_example_file do |sass_directory, directory|

  describe 'friendly_name' do
    it 'should remove the beginning underscore and file extension' do
      simple.friendly_name.should == 'whatever'
    end

    it 'should return friendly with numbers and dashes and underscores' do
      crazy.friendly_name.should == 'whatever-test_1'
    end
  end

  describe 'display_name' do
    it 'should return a human friendly name' do
      nested.display_name.should == 'Whatever'
    end
  end

  describe 'sass_path' do
    it 'should return the path to all associated sass files' do
      Dir.should_receive(:glob).with(File.join(sass_directory, 'nested', 'whatever', '*.{sass,scss}')).and_return('a bunch of files')
      nested.sass_path.should == 'a bunch of files'
    end
  end

  describe 'directory' do
    it 'should return the directory name' do
      nested.directory.should == Pathname.new(File.join(directory, 'nested'))
    end
  end

  describe 'file_name' do
    it 'should return the file name' do
      nested.file_name.should == Pathname.new('_whatever.html.haml')
    end
  end

  describe 'relative_to_root' do
    it 'should return the directory name' do
      nested.relative_to_root.should == Pathname.new('nested/_whatever.html.haml')
    end
  end

  describe 'markdown' do

    context 'markdown file exists' do

      before do
        Dir.stub(:glob).and_return(['some.markdown'])
        File.stub(:exists?).with('some.markdown').and_return(true)
      end

      it 'should return the contents of the markdown file' do
        IO.should_receive(:read).with('some.markdown').and_return('markdown contents')
        nested.markdown.should == 'markdown contents'
      end

    end

    context 'no markdown file exists' do
      before do
        Dir.stub(:glob).and_return([])
      end

      it 'should return the contents of the markdown file' do
        nested.markdown.should == nil
      end
    end
  end
end
