module SleightOfHand

  class BlankObject

    def self.wipe
      instance_methods.reject { |m| m =~ /^__/ }.each { |m| undef_method m }
    end

    def initialize
      BlankObject.wipe
    end

  end

  class EnumeratingProxy < BlankObject

    def initialize(target, iterator_method)
      super()
      @target = target
      @iterator_method = iterator_method
    end

    def method_missing(method, *args)
      @target.send(@iterator_method) { |item| item.send(method, *args) }
    end

  end

end

class Array
  alias __binary_star *
  def *(*args)
    unless args.empty?
      __binary_star(*args)
    else
      SleightOfHand::EnumeratingProxy.new(self, :map)
    end
  end

  alias __original_select select
  def select(*args, &block)
    if block_given?
      __original_select(*args, &block)
    else
      SleightOfHand::EnumeratingProxy.new(self, :select)
    end
  end
  alias find_all select
  alias / select
end
