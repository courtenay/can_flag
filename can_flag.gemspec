Gem::Specification.new do |s|
  s.name = %q{can_flag}
  s.version = "1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Courtenay Gasking"]
  s.email = ["courtenay@entp.com"]
  s.extra_rdoc_files = ["MIT-LICENSE"]

  s.files = Dir["lib/**/*.rb"] + Dir["test/*"] + %w(MIT-LICENSE README)
  s.has_rdoc = true
  s.homepage = 'http://github.com/courtenay/can_flag'
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubygems_version = '1.2.0'
  s.summary = %q{Rails plugin to allow users to flag content for review}
  s.test_files = Dir["test/*.rb"]

  s.add_dependency(%q<activesupport>, ["~> 3"])
  s.add_dependency(%q<activerecord>,  ["~> 3"])
end
