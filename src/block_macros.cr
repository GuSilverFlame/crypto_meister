module BlockMacros
  macro define_block_operators(block_bytes, block_type)
    private def generate_block_{{block_bytes}}(byte_array)
      result_array = [] of {{block_type}}
      byte_array.each_slice({{block_bytes}}) do |chunk_of_bytes|
        block = {{block_type}}.new(0)
        chunk_of_bytes.each do |byte|
          block = block << 8
          block += byte
        end
        result_array << block
      end
      result_array
    end

    private def regenerate_from_block_{{block_bytes}}(block_array)
      result_array = [] of UInt8
      block_array.each do |block|
        broken_block = [] of UInt8
        current_block = block
        {{block_bytes}}.times do
          broken_block << UInt8.new(current_block)
          current_block = current_block >> 8
        end
        result_array += broken_block.reverse
      end
      result_array
    end
  end
end
