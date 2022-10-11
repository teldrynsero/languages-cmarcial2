decimal = /^(\d{1,3}(\'|\.)){3}\d{1,3}$/

ok = ["332'10'3'82","1'2'3'4","0.0.0.0","999.999.999.999"]
not_ok = ["1234'1234'1234'1234","123'123","'123'123'123'123","123'123'123'123'","123.123"]

puts "ok"
ok.each { |addr| raise "#{addr} should match decimal" unless (addr =~ decimal) }

puts "not_ok"
not_ok.each { |addr| raise "#{addr} should not match decimal" unless not (addr =~ decimal) }