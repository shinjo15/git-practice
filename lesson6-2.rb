puts "計算をはじめます"
puts "何回計算を繰り返しますか？"
i = gets.to_i
while i >= 1 do
  puts "s回目の計算"
　puts "2つの値を入力してください"
　a = gets.to_i
　b = gets.to_i
　puts "計算結果を出力します"
　puts "a+b=#{a+b}"
　puts "a-b=#{a-b}"
　puts "a*b=#{a*b}"
　puts "a/b=#{a/b}"
end