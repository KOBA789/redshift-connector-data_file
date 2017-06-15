Gem::Specification.new do |spec|
  spec.name          = "redshift-connector-data_file"
  spec.version       = "7.0.0"
  spec.authors       = ["Hidekazu Kobayashi", "Minero Aoki"]
  spec.email         = ["kobahide789@gmail.com", "aamine@loveruby.net]

  spec.summary       = "Utility classes for exported data files from Redshift"
  spec.homepage      = "https://github.com/bricolages/redshift-connector-data_file"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) {|f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
end
