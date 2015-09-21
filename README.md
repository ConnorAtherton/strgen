# Strgen ![Build Status](https://api.travis-ci.org/ConnorAtherton/strgen.svg)

An arbitrary Ruby string generator

## Usage

```ruby
# Default string 12 chars long
Strgen.generate

# Customised string
Strgen.generate do |c|
  c.length = 30
  c.symbols = false
  c.repeat = false
end
```

##### Options

Include these in the config block when generating the string (see above)

- **numbers** - Numbers 0-9
- **symbols** - The following set `[! @ # $ % ^ & ( ) { } [ ] - _ < > ?]`
- **lowercase** - The lowercase alphabet
- **uppercase** - The uppercase alphabet
- **alpha** - A combination of lowercase and uppercase letters.
- **alphanum** -  A combination of the alpha set and numbers
- **length** - The length of the result string
- **repeat** - Whether repeated characters are allowed
- **exclude** - a character array containing individual letters to exclude

#### Example

Give me a 25 letter string containing the set of all uppercase
letters excluding the letters `A` and `B`.

```ruby
Strgen.generate do |c|
  c.lowercase = false
  c.numbers = false
  c.symbols = false
  c.length = 25
  c.exclude = %w(A B)
end

=> "WUVWREFYEOCCKOHPQCJDJTEZC"
=> "ZKCTKPLXNMFWIZWHCRVUHLHNZ"
=> "FQQDNQKZLVRJIQNFIJHKZKWSO"
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/strgen/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
