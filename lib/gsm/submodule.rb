require 'pathname'
require 'rugged'

module GSM
  
  # A {GSM::Submodule} instance is responsible for checking the current/latest tag and updating
  # the repository to the latest tag, if needed.
  class Submodule
    
    attr_reader :path, :repo
    attr_writer :name
    
    def initialize(path)
      raise TypeError, "'path' must be a String a Pathname" unless path.is_a?(String) || path.is_a?(Pathname)
      
      @path = Pathname.new(path)
      initialize_git_repo
    end
    
    def name
      return @name unless @name.nil?
      return @path.basename.to_s unless git?
      
      origin = Rugged::Remote.each(@repo).find { |remote| remote.name == 'origin' }
      
      File.basename( origin.url, '.git' )
    end
    
    def git?
      !@repo.nil?
    end
    
    def exist?
      @path.exist?
    end
    
    def latest_tag
      # git describe --exact-match --tags $(git log -n1 --pretty='%h')
      # TODO: Find usage in LibGit or Grit
    end
    
    protected
    
    def initialize_git_repo
      @repo = Rugged::Repository.new(@path.to_s) rescue nil
    end
    
  end
  
end
