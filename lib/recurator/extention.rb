require 'recurator/recurator'

class Array
  def to_recur
    Recurator.new self
  end
end

class Hash
  def to_recur
    Recurator.new self
  end
end
