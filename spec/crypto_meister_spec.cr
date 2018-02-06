require "./spec_helper"

describe CryptoMeister do

  describe ".new_agent" do
    it "returns an xor encryption object by default" do
      CryptoMeister.new_agent("password").should be_a(CryptoMeister::XorEncryption)
    end

    it "returns an xor encryption object when pointed" do
      CryptoMeister.new_agent("password", :xor).should be_a(CryptoMeister::XorEncryption)
    end

    it "raises exception when agent type is invalid" do
      expect_raises(Exception, "AgentTypeUnrecognized") do
        CryptoMeister.new_agent("password", :wrong_type)
      end
    end

  end

  describe ".process_text" do
    it "returns a string" do
      CryptoMeister.process_text("a", CryptoMeister::XorEncryption.new("test"))
    end

    it "raises exception when processing without agent" do
      expect_raises(Exception, "EncryptionAgentMissing") do
        CryptoMeister.process_text("a")
      end
    end
  end
end
