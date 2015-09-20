require 'spec_helper'

describe Strgen do
  it 'has a version number' do
    expect(Strgen::VERSION).not_to be nil
  end

  it 'generates a 12 character string by default' do
    string = Strgen.generate
    expect(string.length).to eq(12)
    expect(string.is_a?(String)).to eq(true)
  end

  it 'accepts a configuration block' do
    string = Strgen.generate {}
    expect(string.is_a?(String)).to eq(true)
  end

  it 'has the correct length' do
    length = 25
    string = Strgen.generate { |c| c.length = length }
    expect(string.length).to eq length
  end

  it 'throws for an invalid length' do
    length = -2
    expect do
      Strgen.generate { |c| c.length = length }
    end.to raise_error(Strgen::InvalidLengthError)
  end

  describe 'string parameters' do
    trials = 10

    # it 'lowercase' do
    #   trials.times do
    #     string = Strgen.generate { |c| c.lowercase = false }
    #     binding.pry
    #     expect(string.does_not_include(Strgen::LOWERCASE)).to eq true
    #   end
    # end

    # it 'uppercase', focus: :true do
    #   trials.times do
    #     string = Strgen.generate { |c| c.uppercase = false }
    #     binding.pry
    #     expect(string.does_not_include(Strgen::UPPERCASE)).to eq true
    #   end
    # end

    # it 'symbols' do
    #   trials.times do
    #     string = Strgen.generate { |c| c.symbols = false }
    #     expect(string.does_not_include(Strgen::SYMBOLS)).to eq true
    #   end
    # end
  end
end
