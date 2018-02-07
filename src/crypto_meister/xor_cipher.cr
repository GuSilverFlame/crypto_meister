module CryptoMeister
  class XorCipher

    @key_value : UInt8
    def initialize(key_string : String)
      raise "EmptyParameter" if key_string.size == 0
      @key_value = ~(key_string.bytes.sum/key_string.size)
    end

    def process(content_string : String)
      content = content_string.bytes
      content.map {|e| (e^key_value).chr}.join
    end

    private def key_value
      @key_value
    end

  end
end
