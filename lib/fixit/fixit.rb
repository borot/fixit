class Fixit
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
        assigneds[name] = candidate[:obj]
        assigneds[name].save!
      end
    end

    def prepare
      require 'spec/fixit.rb' if File.exists? 'spec/fixit.rb'
      Dir["spec/fixit/*.rb"].each {|f| require f }
      @@prepared = true
    end

    def prepared?
      !!@@prepared
    end
  end
end
