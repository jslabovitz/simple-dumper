module Simple

  module Dumper

    DUMP_PRINTABLE_BYTES = 32..127

    def self.dump(data, prefix: nil, output: STDOUT)
      0.step(by: 4, to: data.length - 1) do |offset|
        chunk = data[offset, 4]
        words = chunk.unpack('L*')
        bytes = chunk.bytes
        output.puts '%s+ 0x%04x         %s      %s      %s      %s      %s' % [
          prefix,
          offset,
          words.map { |w| '0x%08x' % w }.join(', '),
          words.map { |w| '%10d' % w }.join(', '),
          bytes.map { |b| '0x%02x' % b }.join(', '),
          bytes.map { |b| '%3d' % b }.join(', '),
          bytes.map { |b| DUMP_PRINTABLE_BYTES.include?(b) ? b.chr : '.' }.join,
        ]
      end
      output.puts
    end

  end

end