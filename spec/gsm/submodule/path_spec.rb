require 'spec_helper'

describe GSM::Submodule, '#path' do
  
  subject { valid_instance }
  
  it 'should return the path given when initialized as a Pathname' do
    subject.path.should == Pathname.new('/foo/bar')
  end
  
end
