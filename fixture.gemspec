Gem::Specification.new do |s|
  s.name            = "fixture"
  s.version         = "0.0.8"
  s.platform        = Gem::Platform::RUBY
  s.summary         = "simple fixture"
  s.license         = "MIT"

  s.description = <<-EOF
Formerly known as 'fixit'.
see https://github.com/borot/fixture .
EOF

  s.files           = Dir['{lib/**/*}'] +
                        %w(fixture.gemspec Rakefile README.md)
  s.require_path    = 'lib'

  s.author          = 'Masato Ishimoto'
  s.email           = 'masato.ishimoto@gmail.com'
  s.homepage        = 'https://github.com/borot/fixture'
end
