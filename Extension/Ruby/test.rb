#!/user/bin/ruby -w

puts "Hello, Ruby!"


print <<EOF
	这是第一种方式创建here document
	多行字符串
EOF

for i in 0..5
       if i < 2 then
	         next
		    end
          puts "局部变量的值为 #{i}"
end

ARRAY = ["O","K"];
$string = "";
ARRAY.each do [i] 
 $string += ARRAY[i];
end
put $string;

