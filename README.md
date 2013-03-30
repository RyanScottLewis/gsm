# GSM

Git Submodule Manager.

Easily update all of your git projects's submodules to their latest tags.

## Install

### Bundler: `gem 'gsm'`

### RubyGems: `gem install gsm`

## Usage

### Plain Ol' Ruby

```rb
require 'gpm'

submodule = GSM::Submodule.new('lib/coollib') # Accepts Pathname or Strings containing a file path.

p submodule.path             # => #<Pathname:/Users/foo/Code/my-project/lib/coollib>

p submodule.name             # => 'cool-lib-js' # Gathered from remote's URI by default.
p submodule.name = 'coollib' # => 'coollib'     # Can be set to an arbitrary name. Not really needed unless integrating into Rake, Thor, etc..
p submodule.name             # => 'coollib'

p submodule.git?             # => false # Checks that path.join('.git').exist?
p submodule.remote?          # => false
p submodule.exist?           # => false # Simple delegate to #path

submodule.remote = 'git@github.com:some-people/cool-js-lib.git'

p submodule.git?             # => false
p submodule.remote?          # => true
p submodule.exist?           # => false

p submodule.branch           # => 'master' # Default
submodule.branch = 'stable'
p submodule.branch           # => 'stable'

submodule.after_update do |submodule| # Add an 'after update' hook.
  p "Submodule `#{ submodule.name }` was updated!"
  p "Current tag is now at `#{ submodule.current_tag }`"
end

p submodule.current_tag      # => nil
p submodule.latest_tag       # => nil
p submodule.latest?          # => false

p submodule.update           # => true     # Aliased as #checkout

p submodule.git?             # => true
p submodule.remote?          # => true
p submodule.exist?           # => true

p submodule.current_tag      # => 0.4.1
p submodule.latest_tag       # => 0.4.1
p submodule.latest?          # => false

# A few weeks later.....

p submodule.current_tag      # => 0.4.1
p submodule.latest_tag       # => 0.4.6
p submodule.latest?          # => false

p submodule.update           # => true

p submodule.current_tag      # => 0.4.6
p submodule.latest_tag       # => 0.4.6
p submodule.latest?          # => true

p submodule.update           # => false

project = GSM::Project.new('.')         # Accepts Pathname or Strings containing a file path.

project.submodules << submodule         # This accepts GSM::Submodule instances, Pathnames, or Strings containing a file path. Aliased as #add_submodule.
project.submodules << 'lib/anotherlib'

project.submodules.all     # => [ #<GSM::Submodule:0x0001 ... >, ... ]

project.submodules.latest? # => false   # Are all submodules at their latest tags?
project.submodules.stale   # => [ ... ] # Return all submodules which are not at their latest tag.

project.submodules.update  # => true    # Update all stale submodules to their latest tags.

project.submodules.latest? # => true
project.submodules.stale   # => []

project.submodules.update  # => false
```

### Rake

```rb
require 'gpm/rake'

GSM::Rake.new do |project|
  
  project.submodule do |submodule|
    submodule.name   = 'coollib'                                    # Arbitrary name. Used as the Rake namespace and task. Gathered from remote URI if unset.
    submodule.remote = 'git@github.com:some-people/cool-js-lib.git' # The URI of the git submodule's remote.
  end
  
  project.submodule do |submodule|
    submodule.remote = 'git@github.com:other-people/another-lib-coffee.git'
  end
  
end
```

This would add the following Rake tasks:

```
coollib:current_tag             # Return the current tag of `coollib`
coollib:latest_tag              # Return the latest tag of `coollib`
coollib:latest?                 # Check to see if `coollib` is at the latest tag
coollib:update                  # Update `coollib` to the latest tag
another-lib-coffee:current_tag  # Return the current tag of `another-lib-coffee`
another-lib-coffee:latest_tag   # Return the latest tag of `another-lib-coffee`
another-lib-coffee:latest?      # Check to see if `another-lib-coffee` is at the latest tag
another-lib-coffee:update       # Update `another-lib-coffee` to the latest tag
submodules:latest?              # Check to see if all submodules are at their latest tags
submodules:update               # Update all submodules to their latest tags
```

## Contributing

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2013 Ryan Scott Lewis. See LICENSE for details.