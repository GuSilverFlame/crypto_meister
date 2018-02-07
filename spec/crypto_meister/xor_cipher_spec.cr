require "../spec_helper"

subject = CryptoMeister::XorCipher.new("test")
describe CryptoMeister::XorCipher do

  it "raises exception when key is empty" do
    expect_raises(Exception) do
      CryptoMeister::XorCipher.new("")
    end
  end

  describe "#process" do
    it "returns an encrypted string" do
      subject.process("something").should eq "\u0090\u008c\u008e\u0086\u0097\u008b\u008a\u008d\u0084"
    end
  end

end
