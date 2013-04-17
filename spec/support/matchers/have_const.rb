RSpec::Matchers.define :have_const do |const|
  match do |owner|
    owner.const_defined?(const)
  end
end
