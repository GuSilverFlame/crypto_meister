require "./crypto_meister/*"

module CryptoMeister
  def self.new_agent(password : String, agent_type = :xor)
    #TODO add more encryption agents and add to case
    case agent_type
    when :xor
      XorEncryption.new(password)
    else
      raise "AgentTypeUnrecognized"
    end
  end

  def self.process_text(text : String, encryption_agent = nil)
    raise "EncryptionAgentMissing" unless encryption_agent
    encryption_agent.process(text)
  end

end
