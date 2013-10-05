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
    expect(Recurator.new([])).to be_a_instance_of(Recurator)
    expect(Recurator.new({})).to be_a_instance_of(Recurator)
    expect([].to_recur).to be_a_instance_of(Recurator)
    expect({}.to_recur).to be_a_instance_of(Recurator)
  end

  it "include Enumerable" do
    expect(Recurator).to include(Enumerable)
    expect(Recurator.new({}).to_enum).to be_a_instance_of(Enumerator)
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

  it "values" do
    expect(recur.values).to eq([{"two"=>{"three"=>3}}, {"three"=>3}, 3])
  end
end
