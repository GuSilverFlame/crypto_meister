module CryptoMeister
  class XorEncryption

    @password_value : UInt8
    def initialize(password_string : String)
      raise "EmptyParameter" if password_string.size == 0
      @password_value = password_string.bytes.product/password_string.size
    end

    def process(content_string : String)
      content = content_string.bytes
      content.map {|e| (e^password_value).chr}.join
    end

    private def password_value
      @password_value
    end

  end
end
