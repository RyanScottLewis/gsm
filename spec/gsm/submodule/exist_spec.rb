require 'spec_helper'

describe GSM::Submodule, '#exist?' do
  
  subject { described_class.new('/foo') }
  
  context 'When the path exists on the filesystem' do
    
    before(:each) { subject.path.mkpath }
    after(:each) { subject.path.delete }
    
    it { should exist }
    
  end
  
  context 'When the path does not exist on the filesystem' do
    it { should_not exist }
  end
  
end
