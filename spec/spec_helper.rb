$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'strgen'

class String
  def does_not_include(arr)
    each_char { |char| return false if arr.include?(char) }
    true
  end
end
