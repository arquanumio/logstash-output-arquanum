Gem::Specification.new do |s|
  s.name          = 'logstash-output-arquanum'
  s.version       = '0.1.0'
  s.licenses      = ['Apache-2.0']
  s.summary       = 'Redirect your logs to arquanum to analyze your logs.'
  s.description   = 'Arquanum Logstash Plugin can be installed within your current logstash installation.'
  s.homepage      = 'http://www.arquanum.io/guide/en/plugins/arquanum'
  s.authors       = ['Arquanum']
  s.email         = 'dev@arquanum.io'
  s.require_paths = ['lib']

  # Files
  s.files = Dir['lib/**/*','spec/**/*','vendor/**/*','*.gemspec','*.md','CONTRIBUTORS','Gemfile','LICENSE','NOTICE.TXT']
   # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "output" }

  # Gem dependencies
  s.add_runtime_dependency "logstash-core-plugin-api", "~> 2.0"
  s.add_runtime_dependency "logstash-codec-plain", "~> 3.0", ">= 3.0.2"
  s.add_runtime_dependency "httparty", "~> 0.11.0"
  s.add_development_dependency "logstash-devutils", "~> 1.3", ">= 1.3.1"
end
