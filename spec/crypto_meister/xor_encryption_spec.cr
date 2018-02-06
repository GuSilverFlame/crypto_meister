require "../spec_helper"

subject = CryptoMeister::XorEncryption.new("test")
describe CryptoMeister::XorEncryption do

  it "raises exception when password is empty" do
    expect_raises(Exception) do
      CryptoMeister::XorEncryption.new("")
    end
  end

  describe "#process" do
    it "returns an encrypted string" do
      subject.process("something").should eq "osqyhtur{"
    end
  end

end
