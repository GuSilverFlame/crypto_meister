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
      subject.process("something").should eq "C_]UDXY^W"
    end
  end

end
