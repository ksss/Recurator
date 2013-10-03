require 'helper'

describe Recurator do
  let :recur do
    Recurator.new({
      "one" => {
        "two" => {
          "three" => 3
        }
    }
    })
  end

  it "initialize" do
    Recurator.new({})
  end

  it "include Enumerable" do
    Recurator.include?(Enumerable)
  end

  it "each" do
    ret = []
    recur.each {|o|
      ret << o
    }
    expect(ret).to eq([["one",{"two"=>{"three"=>3}}], ["two",{"three"=>3}], ["three",3]])
  end

  it "keys" do
    expect(recur.keys).to eq(["one","two","three"])
  end
end
