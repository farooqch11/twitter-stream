#task3
result = Hash.new
[10,5,2,20].each do |number|
  factors=[];
  n = 1
  while n <= number
    n += 1
    if number % n == 0
      if number !=n
        factors.push(n)
      end
    end
  end
  result[number]=factors
end
a="";
result.map{|x,v| a += x.to_s + " :" + v.to_s + ", " }

puts "{" +a+ "}"