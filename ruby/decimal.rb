decimal = /^-?\d{1,3}('?\d{3})*(\.\d+)?$/

ok = ["3.14","1'000'000.0001","1000","999.999","-123'123'123.123"]
not_ok = ["1234'1234'1234'1234","123.00'10","'12'00.00","-99'99'99.99"]

puts "ok"
ok.each { |addr| raise "#{addr} should match decimal" unless (addr =~ decimal) }

puts "not_ok"
not_ok.each { |addr| raise "#{addr} should not match decimal" unless not (addr =~ decimal) }