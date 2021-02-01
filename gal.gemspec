# frozen_string_literal: true

require_relative "lib/gal/version"

Gem::Specification.new do |spec|
  spec.name          = "gal"
  spec.version       = Gal::VERSION
  spec.authors       = ["vedranvinko"]
  spec.email         = ["vinkovedran@gmail.com"]

  spec.summary       = "Pastebin API wrapper"
  spec.description   = "A small wrapper for Pastebin API"
  spec.homepage      = "https://github.com/vedranvinko/gal"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/vedranvinko/gal"
  spec.metadata["changelog_uri"] = "https://github.com/vedranvinko/gal/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "dotenv"
  spec.add_runtime_dependency "rest-client"
end
