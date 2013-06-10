Gem::Specification.new do |s|
  s.name            = "fixit"
  s.version         = "0.0.3"
  s.platform        = Gem::Platform::RUBY
  s.summary         = "simple fixture for rspec"
  s.license         = "MIT"

  s.description = <<-EOF
Fixit providees a minimal interface for using fixuture.
Also see http://borot.github.com/.
EOF

  s.files           = Dir['{lib/**/*}'] +
                        %w(fixit.gemspec Rakefile README.rdoc)
  s.require_path    = 'lib'

  s.author          = 'Masato Ishimoto'
  s.email           = 'masato.ishimoto@gmail.com'
  s.homepage        = 'http://borot.github.com/'
end
