require 'spec_helper'

describe GSM::Submodule, '#name' do
  
  subject { valid_instance }
  
  let(:mock_origin_remote) do
    mock.tap { |m| m.expects(:name).returns('origin') }
  end
  
  let(:mock_heroku_remote) do
    mock.tap { |m| m.expects(:name).returns('heroku') }
  end
  
  context 'When the name attribute is not set' do
          
    context 'and the #path is a valid Git project' do
      
      before(:each) { subject.expects(:git?).returns(true) }
      
      it 'should return the basename of the Git remote without the extension' do
        Rugged::Remote.expects(:each).with(mock_repo).returns([ mock_origin_remote, mock_heroku_remote ])
        mock_origin_remote.expects(:url).returns('git://example.com/example-company/example-project.git')
        mock_heroku_remote.expects(:url).never
        
        subject.name.should == 'example-project'
      end
      
    end
    
    context 'and the #path is not a valid Git project' do
      
      before(:each) { subject.expects(:git?).returns(false) }
      
      it 'should return the basename of the path' do
        subject.name.should == 'bar'
      end
      
    end
    
  end
  
  context 'and the name attribute is set' do
    
    before(:each) do
      subject.name = 'test_value'
      subject.expects(:git?).never
    end
    
    it 'should return the value of the name attribute' do
      subject.name.should == 'test_value'
    end
    
  end
  
end
