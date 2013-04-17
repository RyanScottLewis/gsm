require 'spec_helper'

describe GSM::Submodule, '#initialize' do
  
  context 'When no arguments are given' do
    
    it 'should raise an error' do
      expect { described_class.new }.to raise_error(ArgumentError, 'wrong number of arguments (0 for 1)')
    end
    
  end
  
  context 'When multiple arguments are given' do
    
    it 'should raise an error' do
      expect { described_class.new('/foo', '/bar') }.to raise_error(ArgumentError, 'wrong number of arguments (2 for 1)')
    end
    
  end
  
  context 'When a single argument is given' do
    
    context 'and it is a String' do
      
      it 'should not raise an error' do
        expect { described_class.new('/foo') }.not_to raise_error
      end
      
    end
    
    context 'and it is a Pathname' do
      
      it 'should not raise an error' do
        expect { described_class.new( Pathname.new('/foo') ) }.not_to raise_error
      end
      
    end
    
    context 'and it is neither a String nor Pathname' do
      
      it 'should raise an error' do
        expect { described_class.new(nil) }.to raise_error(TypeError)
        expect { described_class.new(123) }.to raise_error(TypeError)
        expect { described_class.new([]) }.to raise_error(TypeError)
        expect { described_class.new({}) }.to raise_error(TypeError)
      end
      
    end
    
  end
  
end
