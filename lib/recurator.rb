class Recurator
  include Enumerable

  def initialize (obj)
    @obj = obj
  end

  def each
    looper = lambda { |o|
      case o
      when Array
        o.each_with_index {|i, index|
          yield [index, i]
          looper.call(i)
        }
      when Hash
        o.each { |key, value|
          yield [key, value]
          looper.call(value)
        }
      end
    }

    if block_given?
      looper.call(@obj)
    else
      self.to_enum
    end
  end

  def keys
    map { |key, value| key }
  end

  def values
    map { |key, value| value }
  end

  def flatten
    ret = []
    each { |key, value|
      ret << key
      if !value.kind_of?(Array) && !value.kind_of?(Hash)
        ret << value
      end
    }
    ret
  end
end
