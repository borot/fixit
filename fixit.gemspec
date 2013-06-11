Gem::Specification.new do |s|
  s.name            = "fixit"
  s.version         = "0.0.6"
  s.platform        = Gem::Platform::RUBY
  s.summary         = "simple fixture for rspec"
  s.license         = "MIT"

  s.description = <<-EOF
Fixit provides a minimal interface for using fixuture.
Also see https://github.com/borot/fixit .
EOF

  s.files           = Dir['{lib/**/*}'] +
                        %w(fixit.gemspec Rakefile README.md)
  s.require_path    = 'lib'

  s.author          = 'Masato Ishimoto'
  s.email           = 'masato.ishimoto@gmail.com'
  s.homepage        = 'https://github.com/borot/fixit'
end
