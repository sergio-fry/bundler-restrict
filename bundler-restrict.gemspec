require_relative "lib/bundler/restrict/version"

Gem::Specification.new do |spec|
  spec.name = "bundler-restrict"
  spec.version = Bundler::Restrict::VERSION
  spec.authors = ["Sergei O. Udalov"]
  spec.email = ["sergei.udalov@gmail.com"]

  spec.summary = "Bundler restrictions"
  spec.description = "Disallow gem versions by release date"
  spec.homepage = "https://github.com/sergio-fry/bundler-restrict"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/sergio-fry/bundler-restrict.git"
  spec.metadata["changelog_uri"] = "https://github.com/sergio-fry/bundler-restrict/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "gems"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
