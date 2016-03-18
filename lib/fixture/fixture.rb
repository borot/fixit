class Fixture
  def initialize(klass)
    @klass = klass
  end

  def assign( name, &block )
    self.class.candidates[name] = @candidate = { obj: @klass.new, attributes: {} }
    yield
  end

  def attribute( name, *args, &block)
    val = args.first 
    val = block if block_given?
    @candidate[:attributes][name] = val
  end

  alias method_missing attribute

  class << self
    FIXTURE_FILE = 'fixtures.rb'
    FIXTURE_DIR  = 'fixture'

    @@prepared = false

    def manage( klass, &block )
      self.new(klass).instance_eval &block
    end

    def get( name )
      assigneds[name]
    end

    def assigneds
      @@assigneds ||= {}
    end

    def candidates
      @@candidates ||= {}
    end

    def load 
      prepare unless prepared?

      candidates.each do |name, candidate|
        candidate[:attributes].each do |attr, val|
          candidate[:obj].send("#{attr}=", val.is_a?(Proc) ? val.call : val) 
        end

        assigneds[name] = obj = candidate[:obj]

        if obj.respond_to? :save!
          obj.save!
        elsif obj.respond_to? :save
          obj.save
        end
      end
    end

    def prepare
      %w(spec test).each do |dir|
        require "#{dir}/#{FIXTURE_FILE}" if File.exists? "#{dir}/#{FIXTURE_FILE}" 
        Dir["#{dir}/#{FIXTURE_DIR}/*.rb"].each {|f| require f }
      end
      @@prepared = true
    end

    def prepared?
      !!@@prepared
    end
  end
end
