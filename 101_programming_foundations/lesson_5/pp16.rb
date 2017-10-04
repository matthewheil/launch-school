HEX = { 10 => 'a',
        11 => 'b',
        12 => 'c',
        13 => 'd',
        14 => 'e',
        15 => 'f' }

def random_hex_string(size)
  str = ''
  size.times do
    num = rand(0..15)
    if num >= 10
      str.concat(HEX[num])
    else
      str.concat(num.to_s)
    end
  end
  str
end

def create_uuid
  uuid = ''
  sizes = [8, 4, 4, 4, 12]
  sizes.each do |size|
    if size == 12
      uuid.concat(random_hex_string(size))
    else
      uuid.concat(random_hex_string(size)).concat('-')
    end
  end
  uuid
end

p create_uuid
