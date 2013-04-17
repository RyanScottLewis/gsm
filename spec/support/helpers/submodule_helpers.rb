def mock_repo
  @mock_repo ||= mock
end

def valid_instance
  Rugged::Repository.stubs(:new).returns(mock_repo)
  
  GSM::Submodule.new('/foo/bar')
end
