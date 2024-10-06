require_relative 'lib/smstools_api/version'

Gem::Specification.new do |spec|
  spec.name = 'smstools_api'
  spec.version = SmstoolsApi::VERSION
  spec.authors = ['Tom de Grunt']
  spec.email = ['tom@degrunt.nl']

  spec.summary = 'Smstools API'
  spec.description = 'Smstools API'
  spec.homepage = 'https://github.com/entdec/smstools_api'
  spec.license = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/entdec/smstools_api'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'faraday', '>= 2.9'
  spec.add_runtime_dependency 'hashie', '>= 5'

  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rubocop', '~> 1.65'
  spec.add_development_dependency 'standard', '~> 1.35'
  spec.add_development_dependency 'vcr', '>= 6'
end
