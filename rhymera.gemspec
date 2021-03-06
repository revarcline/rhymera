# frozen_string_literal: true

require_relative 'lib/rhymera/version'

Gem::Specification.new do |spec|
  spec.name          = 'rhymera'
  spec.version       = Rhymera::VERSION
  spec.authors       = ['Alex Cline']
  spec.email         = ['rev.a.r.cline@gmail.com']

  spec.summary       = 'rhyme and portmanteau generator'
  spec.description   = 'uses RhymeBrain api to find rhymes and portmanteaus'
  spec.homepage      = 'https://github.com/revarcline/rhymera'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.6.1')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/revarcline/rhymera.git'
  spec.metadata['changelog_uri'] = 'https://github.com/revarcline/rhymera/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'bin'
  spec.executables   = %w[rhymera]
  spec.require_paths = %w[lib bin]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency 'clipboard', '~> 1.3'
  spec.add_dependency 'tty-prompt', '~> 0.23'

  spec.add_development_dependency 'bundler', '~> 2.2'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.9'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
