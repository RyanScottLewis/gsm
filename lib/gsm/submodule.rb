module GSM
  
  # A {GSM::Submodule} instance is responsible for checking the current/latest tag and updating
  # the repository to the latest tag, if needed.
  class Submodule
    
    def latest_tag
      # git describe --exact-match --tags $(git log -n1 --pretty='%h')
      # TODO: Find usage in LibGit or Grit
    end
    
  end
  
end
