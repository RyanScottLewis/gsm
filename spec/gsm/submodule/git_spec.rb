require 'spec_helper'

describe GSM::Submodule, '#git?' do
  
  context 'When the repo was initialized' do
    
    subject { valid_instance }
    
    it { should be_git }
    
  end
  
  context 'When the repo was initialized' do
    
    subject { described_class.new('/foo') }
    
    before(:each) { Rugged::Repository.expects(:new).raises(StandardError) }
    
    it { should_not be_git }
    
  end
  
end
