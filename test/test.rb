$VERBOSE = false

require 'minitest/autorun'
require 'minitest/power_assert'

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'simple-dumper'

class Simple::Dumper::Test < Minitest::Test

  def test_dump
    io = StringIO.new
    data = (0..8).to_a.pack('C*')
    Simple::Dumper.dump(data, output: io)
    io.rewind
    str = io.read
    assert { str&.length > 0 }
  end

end