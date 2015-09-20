require 'strgen/version'

#
# Usage:
#
# Strgen.generate do |config|
#   config.length = 10
#   exclude = %w(!)
# end
#
class Strgen
  NUMBERS = (1..9).to_a.map(&:to_s)
  LOWERCASE = ('a'..'z').to_a
  UPPERCASE = ('A'..'Z').to_a
  ALPHA = LOWERCASE.concat UPPERCASE
  ALPHANUM = ALPHA.concat NUMBERS
  SYMBOLS = %w(! @ # $ % ^ & \( \) { } [ ] - _ < > ?)
  TYPES = %i(numbers lowercase uppercase symbols)

  attr_accessor *TYPES, :length, :alpha, :alphanum, :exclude, :repeat

  # Errors
  class InvalidLengthError < StandardError; end

  def self.generate(&block)
    proxy = new
    block.call(proxy) if block_given?
    proxy.merge_defaults!

    raise InvalidLengthError if proxy.length < 1

    previous = nil
    current = nil
    acc = ''
    characters = proxy.character_set

    # store the last char in case we want to
    # avoid repeating characters
    proxy.length.times do
      loop do
        current = characters.sample
        break if !proxy.exclude?(current) && (!proxy.repeat || current != previous)
      end

      acc += current
    end

    acc
  end

  def merge_defaults!
    TYPES.each_with_object({}) do |type, acc|
      acc[type] = true
      acc
    end.tap do |hash|
      hash.merge! length: 12, repeat: true
    end.each do |method, default|
      next unless send(method.to_sym).nil?
      send("#{method}=".to_sym, default)
    end
  end

  def character_set
    # TODO: can we do this better?
    a = []
    a.concat(SYMBOLS) if symbols
    a.concat(ALPHANUM) if alphanum
    a.concat(ALPHA) if alpha? || alpha
    a.concat(NUMBERS) if alpha? || numbers
    a.concat(LOWERCASE) if letters? || lowercase
    a.concat(UPPERCASE) if letters? || uppercase
    a
  end

  def exclude?(val)
    return false if exclude.nil?
    exclude.include? val
  end

  def alpha?
    nil if alphanum
  end

  def letters?
    nil if alpha
  end

  def pick_all?
    !lowercase && !uppercase && !alpha && !alphanum && !symbols
  end
end
