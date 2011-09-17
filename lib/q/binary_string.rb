class BinaryString < String
  def self.create from_string
    from_string.force_encoding "BINARY"
    from_string
  end 
end